require 'bundler/setup'
Bundler.setup

require 'em-eventsource'

require 'watersupply-client/version'
require 'watersupply-client/client'
require 'rufus/scheduler'
require 'gpio'
require 'json'

module Watersupply
  def self.start!

    client.on "create" do

    end

    client.on "reset" do

    end

    @tasks = [{
      task_id: 1,
      start_time: (Time.now + 5).to_json,
      duration: "10",
      message: "turn on station 1"
    },{ 
      task_id: 22,
      start_time: (Time.now + 10).to_json,
      duration: "15",
      message: "turn on station 2"
    }]

    @tasks.each do |task|
      scheduler.at task[:start_time] do |job|
        puts task[:message]
        sleep task[:duration].to_i
        puts "turn off station"
      end
    end

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
