$:.unshift File.join(File.dirname(__FILE__))

require "celluloid/autostart"

module Hermes
  module Beacon
    class Observer
      include Celluloid, Celluloid::Notifications

      def initialize
      end
      
      execute_block_on_receiver :subscriber
      
      def subscriber(value, &block)
        @subscribe_callback = block
        subscribe(value, :on_completion)
        # subscribe("scan", :on_completion)
        # subscribe("exited", :on_completion)
        # subscribe("entered", :on_completion)
      end

      def on_completion(*args)
        @subscribe_callback.call(args)
      end
    end
  end
end
