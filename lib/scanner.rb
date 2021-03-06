$:.unshift File.join(File.dirname(__FILE__))

require "celluloid/autostart"

module Hermes
  module Beacon
    class Scanner
      include Celluloid, Celluloid::Notifications
      
      attr_reader :interval, :scans, :quiet_time
      
      def initialize
        @quiet_time = 5.0
        @scans = Hash.new
      end
      
      def scan_with_time_interval(interval)
        @interval = interval
        start_timer(interval)
      end

      def start_timer(interval)
        every interval do
          tick
        end
      end

      def tick
        print
        clean
        scan
      end

      def clean
        scans.each do |key,value|
          scan_item = scans[key]
              
          # Reset RSSI to 0
          scan_item.rssi = 0
          unless scan_item.last_seen.nil?
            # Remove scans older than quite time
            diff = Time.now.to_f - scan_item.last_seen.to_f
            if (diff > quiet_time)
              exit_region(scan_item)
              scans.delete(key)
            end
          end
        end
      end
      
      def print
        scans.each do |key,scan|
          publish("scan", scan)
        end
      end
      
      def scan
        central_manager
      end
      
      def enter_region(scan_item)
        publish("entered", scan_item)
      end
        
      def exit_region(scan_item)
        publish("exited", scan_item)
      end
      
      def central_manager
        scan = Hermes::Beacon.scan
        scan_item = ScanItem.new(scan.uuid,scan.major,scan.minor,scan.power,scan.rssi)
        
        if (scan_item)
          if (scans[scan_item.uuid])
            si = scans[scan_item.uuid]
            si.last_seen = Time.now
            si.rssi = scan_item.rssi
            scans[scan_item.uuid] = si
          else
            scans[scan_item.uuid] = scan_item
            enter_region(scan_item)
          end
        end
      end
        
    end
  end
end