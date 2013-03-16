require 'watersupply-client/tasks/base'
require 'watersupply-client/tasks/run_station'

module Watersupply
  module Tasks
    class << self
      def from_json(json)
        json = JSON.parse json if json.is_a? String
        Watersupply::Tasks.const_get(json['task']['type']).new json['task']
      end
    end
  end
end
