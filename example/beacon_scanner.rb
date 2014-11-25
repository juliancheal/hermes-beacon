require 'hermes_beacon'

exit_requested = false
Kernel.trap("INT") { exit_requested = true }

while !exit_requested
  beacon = Hermes::Beacon.scan
  puts "UUID: #{beacon.uuid}"
  puts "Major: #{beacon.major}"
  puts "Minor: #{beacon.minor}"
  puts "Power: #{beacon.power}"
  puts "RSSI: #{beacon.rssi}"
  puts "Distance: #{beacon.calculate_distance_from_beacon}"
end