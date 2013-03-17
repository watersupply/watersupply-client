module Watersupply
  module Tasks
    class RunStation < Base
      attr_accessor :station

      alias_attribute :duration, :task_size

      def initialize arg

      end

      def run!
        turn_on
        sleep @duration
        turn_off
      end

      def turn_on
        puts "turn on station #{@station}"
      end

      def turn_off
        puts "turn off station #{@station}"
      end

    end
  end
end
