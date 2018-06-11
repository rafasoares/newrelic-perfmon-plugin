#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require "newrelic_plugin"
require_relative "perfmon_metrics.rb"

# Fixes SSL cert without monkeying with PEM file!
require "certified"

module PerfmonAgent
  class Agent < NewRelic::Plugin::Agent::Base
    agent_config_options :local, :hostname, :debug, :testrun

    # Change the following agent_guid if you fork and use this as your own plugin
    # Visit https://newrelic.com/docs/plugin-dev/ for more information
    default_guid = "com.52projects.plugins.perfmon"
    agent_version "0.0.2"

    # Allow GUID to be set in config file under "newrelic" stanza
    if NewRelic::Plugin::Config.config.newrelic['guid'].to_s.empty?
      agent_guid default_guid
    else
      agent_guid NewRelic::Plugin::Config.config.newrelic['guid'].to_s
    end

    agent_human_labels('Perfmon') do
      if hostname.to_s.empty?
        if local
          "#{Socket.gethostname}"
        else
          abort("No hostname defined.\nEnter \"hostname: [your_hostname]\" or \"local: true\" in newrelic_plugin.yml")
        end
      else
        "#{hostname}"
      end
    end

    #  Returns true if there is an environment variable with the given name.

    # Fixes SSL Connection Error in Windows execution of Ruby
    # Based on fix found at: https://gist.github.com/fnichol/867550
    # ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__) + "/config/cacert.pem")
    # puts("CERT FILE: #{ENV['SSL_CERT_FILE']}")

    def setup_metrics
      if ENV.key?('OCRA_EXECUTABLE')
        fileloc = File.dirname(ENV['OCRA_EXECUTABLE'].gsub(/\\/, "/"))
      else
        fileloc = File.expand_path(File.dirname(__FILE__))
      end

      pidfile = fileloc + "/ruby.pid"

      if File.exist?(pidfile)
        File.delete(pidfile)
      end

      File.open(pidfile, 'w') { |file| file.write("#{Process.pid}") }

      @pm = PerfmonMetrics.new
      countersfile = NewRelic::Plugin::Config.config.newrelic['countersfile'].to_s
      if countersfile.to_s.empty?
        counters_file = File.expand_path(File.dirname(__FILE__)) + "/config/perfmon_totals_counters.txt"
      else
        counters_file =  fileloc + "/config/#{countersfile}"
      end

      if File.file?(counters_file)
        if !countersfile.to_s.empty?
          puts("Using Counters File: #{counters_file}")
        end
        @counters = [] #Array.new(@pm.thread_count, "")
        File.open(counters_file) do |counters|
          size = (counters.size/@pm.thread_count.to_f).ceil
          @counters = counters.each_slice(size).map do |slice|
            slice.reduce('') do |result, current|
              next result unless current =~ /^(?!#).+$/
              result + " \"#{current.strip}\""
            end
          end
        end
      else
        abort("No Perfmon counters file named #{counters_file}.")
      end

      if !self.local
        @typeperf_string = "-s #{self.hostname} -sc #{@pm.metric_samples}"
      else
        @typeperf_string = "-sc #{@pm.metric_samples}"
      end
    end

    def poll_cycle
      if self.testrun
        File.open("typeperf_test.txt") { |file| get_perf_data(file) }
        exit
      else
        perf_threads = @counters.map do |c|
          Thread.new(c) do |cthread|
            perf_input = `typeperf #{cthread} #{@typeperf_string}`
            if !perf_input.include? @pm.typeperf_error_msg
              get_perf_data(perf_input.split("\n"))
            elsif self.debug
              puts("This path has no valid counters: #{cthread}")
            end
          end
        end
        perf_threads.each do |t|
          t.join
          Signal.trap("TERM") do
            puts "Exiting..."
            shutdown()
          end
        end
      end
    end

    private

    def get_perf_data(perf_input)
      perf_lines = Array.new
      perf_input.each do |pl|
        if pl.chr.eql?("\"")
          perf_lines << pl.gsub(/\"/, "").gsub(/\[/, "(").gsub(/\]/, ")").gsub(/\\\\[^\\]+\\/, "")
        end
      end
      perf_names = perf_lines[0].split(",")
      perf_values = perf_lines[1].split(",")
      perf_names.each_index do |i|
        if !perf_names[i].rindex("\\").nil?
          metric_name = perf_names[i].slice(perf_names[i].rindex("\\")+1, perf_names[i].length)
          report_metric_check_debug perf_names[i].strip.gsub(/\//," per ").gsub(/\s{2}/," ").gsub(/\\/,"/"), @pm.metric_types[metric_name], perf_values[i]
        end
      end
    end

    def report_metric_check_debug(metricname, metrictype, metricvalue)
      if self.debug
        puts("#{metricname}[#{metrictype}] : #{metricvalue}")
      else
        report_metric metricname, metrictype, metricvalue
      end
    end

    def thishost

    end
  end

  NewRelic::Plugin::Setup.install_agent :perfmon, self
  NewRelic::Plugin::Run.setup_and_run
end
