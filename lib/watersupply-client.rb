require 'bundler/setup'
Bundler.setup

require 'em-eventsource'

require 'watersupply-client/version'
require 'watersupply-client/client'

module Watersupply
  class << self
    attr_writer :client

    def client
      @source_url = "http://watersupp.ly"
      @client ||= EventMachine::EventSource.new(@source_url)

    end

  end

  client.on "create" do

  end

  client.on "read" do

  end

  client.on "update" do

  end

  client.on "delete" do

  end

end
