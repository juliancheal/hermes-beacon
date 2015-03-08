require "hermes_beacon"

scanner = BeaconScanner.new

scanner.subscribe("scan") do |beacon|
  puts "I scan'd a beacon, and it's uuid is #{beacon[1].uuid}"
end
scanner.subscribe("entered") do |beacon|
  puts "I entered'd a beacon, and it's uuid is #{beacon[1].uuid}"
end
scanner.subscribe("exited") do |beacon|
  puts "I exited'd a beacon, and it's uuid is #{beacon[1].uuid}"
end
Hermes::Beacon::Superviser.run
