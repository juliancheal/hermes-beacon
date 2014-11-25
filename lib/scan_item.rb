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
      
      def range
        ranger = calculate_distance_from_beacon
        value = ""
        case
          when ranger < 1.0
            value = "Immediate"
          when ranger < 10.0 && ranger > 1.0
            value = "Near"
          when ranger > 10.0
            value = "Far"
          else
           value = "¯\\_(ツ)_/¯"
        end
        value
      end
      
      def calculate_distance_from_beacon
        # Maths from bit.ly/11Sy7j4
        if (@rssi == 0)
          return -1.0 # if we cannot determine accuracy, return -1.
        end
        ratio = @rssi.to_f*1.0/@power.to_f
        if (ratio < 1.0)
          return ratio**10
        else
          accuracy = (0.89976)* (ratio**7.7095) + 0.111
          return accuracy
        end
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