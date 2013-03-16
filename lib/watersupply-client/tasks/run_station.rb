module Watersupply
  module Tasks
    class RunStation < Base
      attr_accessor :station

      alias_attribute :duration, :task_size

      def initialize arg

      end

      def run
        
      end

      def turn_on()
        puts "turn on station #{}"
      end

      def turn_off()
        puts "turn off station #{}"
      end

    end
  end
end
