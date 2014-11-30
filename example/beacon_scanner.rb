require "hermes_beacon"

$running = true

scanner = Hermes::Beacon::Scanner.new
scanner.async.scan_with_time_interval(1)
obs = Hermes::Beacon::Observer.new

Signal.trap("INT") do
  $running = false
  exit
end

# scanner.scan_with_time_interval(1)
while($running)

  # scans.each do |scan|
  #   puts "UUID: #{scan.uuid}"
  #   puts "Major: #{scan.major}"
  #   puts "Minor: #{scan.minor}"
  #   puts "Power: #{scan.power}"
  #   puts "RSSI: #{scan.rssi}"
  #   puts "Distance: #{scan.calculate_distance_from_beacon}"
  #   puts "Range: #{scan.range}"
  #   puts "LastSeen: #{scan.last_seen}"
  # end
  sleep
end

  # sleep(1)
  # scanner.scan_with_time_interval(1)
  # sleep(1)
  # scanner.scan_with_time_interval(1)
  # sleep(1)
  # scanner.scan_with_time_interval(1)
  # sleep(1)
  # scanner.scan_with_time_interval(1)
  # beacon = Hermes::Beacon.scan
  # puts "UUID: #{beacon.uuid}"
  # puts "Major: #{beacon.major}"
  # puts "Minor: #{beacon.minor}"
  # puts "Power: #{beacon.power}"
  # puts "RSSI: #{beacon.rssi}"
  # puts "Distance: #{beacon.calculate_distance_from_beacon}"
  # puts "Range: #{beacon.range}"
# end