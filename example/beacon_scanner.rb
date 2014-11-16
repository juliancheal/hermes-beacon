require 'hermes_beacon'

beacon = Hermes::Beacon.scan
puts "UUID: #{beacon.uuid}"
puts "Major: #{beacon.major}"
puts "Minor: #{beacon.minor}"
puts "Power: #{beacon.power}"
puts "RSSI: #{beacon.rssi}"
puts "Distance: #{beacon.calculate_distance_from_beacon}m"
