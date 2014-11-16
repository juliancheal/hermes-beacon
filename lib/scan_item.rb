$:.unshift File.join(File.dirname(__FILE__))
module Hermes
  module Beacon
    class ScanItem
      attr_reader :uuid, :major, :minor, :power, :rssi
      def initialize(uuid="", major="", minor="", power="", rssi="")
        @uuid  = uuid
        @major = major
        @minor = minor
        @power = power
        @rssi  = rssi
      end
      
      def calculate_distance_from_beacon
        @rssi.to_f / @power.to_f # and some more maths
      end
      
      def manufacturer
        case @uuid
        when ""
          "Apple"
        when ""
          "Radius Networks"
        when ""
          "Estimote"
        end
      end
    end
  end
end