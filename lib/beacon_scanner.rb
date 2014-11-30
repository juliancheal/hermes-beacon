class BeaconScanner
  def initialize
    @scanner = Hermes::Beacon::Scanner.new
    @scanner.async.scan_with_time_interval(1)
  end
  
  def subscribe(topic, &block)
    obs = Hermes::Beacon::Observer.new
    obs.subscriber(topic,&block)
  end
  
  def on_message(*args)
    @subscribe_callback.call(args)
  end
  
end