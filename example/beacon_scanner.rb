require "hermes_beacon"

$running = true

obs1 = Hermes::Beacon::Observer.new
obs2 = Hermes::Beacon::Observer.new
obs3 = Hermes::Beacon::Observer.new
scanner = Hermes::Beacon::Scanner.new
scanner.async.scan_with_time_interval(1)

obs1.subscriber("entered") do |scan|
  puts "Entered #{scan[1].uuid}"
end

obs2.subscriber("exited") do |scan|
  puts "Exited #{scan[1].uuid}"
end

obs3.subscriber("scan") do |scan|
  puts "Scaned #{scan[1].uuid}"
end

Signal.trap("INT") do
  $running = false
  exit
end

while($running)
  sleep
end

# Future API will look like this
# scanner = BeaconScanner.new
# scanner.subscribe("enter") do |beacon|
#   puts "I entered'd a beacon, and it's uuid is #{beacon.uuid}"
# end
# 
# scanner.subscribe("scan", uuid: "123") do |beacon|
#   puts "I scan'd a beacon, and it's uuid is #{beacon.uuid}"
# end
