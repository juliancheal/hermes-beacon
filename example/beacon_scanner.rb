require "hermes_beacon"

$running = true

obs = Hermes::Beacon::Observer.new
scanner = Hermes::Beacon::Scanner.new
scanner.async.scan_with_time_interval(1)


Signal.trap("INT") do
  $running = false
  exit
end

while($running)

  sleep
end
