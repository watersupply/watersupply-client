require 'bundler/setup'
Bundler.setup
require 'core_ext/module/aliasing'
require 'em-eventsource'
require 'rufus/scheduler'
require 'gpio'
require 'json'
require 'watersupply-client/version'
require 'watersupply-client/tasks'

module Watersupply
  IDENTIFIER = 1
  CAPABILITIES = Watersupply::Tasks.constants.select {|c| Watersupply::Tasks.const_get(c).is_a? Class}

  def self.start!
    # post device id to POST watersupp.ly/devices/CLIENT_ID params capabilities
    # post tasks for this device to the server.
    EM.run do
      http = EventMachine::HttpRequest.new("http://localhost:3000").post head: {"Content-Type" => "application/json"}, path: "/devices", body: {device: {identifier: IDENTIFIER, capabilities: CAPABILITIES}}.to_json
      http.callback {
        p CAPABILITIES
        p http.response_header.status
        EM.stop
      }

      
    end

    client.on "create" do |message|
      
    end

    client.on "read" do

    end

    client.on "update" do

    end

    client.on "delete" do

    end

    # @tasks = [{
    #   task_id: 1,
    #   start_time: (Time.now + 5).to_json,
    #   duration: "10",
    #   message: "turn on station 1"
    # },{ 
    #   task_id: 22,
    #   start_time: (Time.now + 10).to_json,
    #   duration: "15",
    #   message: "turn on station 2"
    # }]

    # @tasks.each do |task|
    #   scheduler.at task[:start_time] do |job|
    #     puts task[:message]
    #     sleep task[:duration].to_i
    #     puts "turn off station"
    #   end
    # end

  end

  class << self
    attr_writer :client, :scheduler

    def client
      @source_url = "http://watersupp.ly"
      @client ||= EventMachine::EventSource.new(@source_url)
    end

    def scheduler
      @scheduler ||= Rufus::Scheduler.start_new
    end

  end
end
