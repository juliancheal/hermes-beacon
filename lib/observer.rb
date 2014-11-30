$:.unshift File.join(File.dirname(__FILE__))

require "celluloid/autostart"

module Hermes
  module Beacon
    class Observer
      include Celluloid, Celluloid::Notifications

      def initialize
        subscribe("scan", :on_completion)
      end

      def on_completion(*args)
        puts args.inspect
      end
    end
  end
end
