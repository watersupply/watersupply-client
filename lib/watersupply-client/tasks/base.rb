module Watersupply
  module Tasks
    class Base
      attr_accessor :task_size, :message, :progress

      def initialize arg

      end

      def run!
        raise NotImplementedError, "#{self.class} does not implement run"
      end

    end
  end
end
