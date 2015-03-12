require "scan_item"
require 'ffi'

module Hermes
  module Beacon
    extend FFI::Library

    ffi_lib 'objc', '/System/Library/Frameworks/Foundation.framework/Foundation', '/System/Library/Frameworks/IOBluetooth.framework/IOBluetooth',
    "#{File.dirname(__FILE__)}/../bin/hermes-beacon"

    def self.scan(interval=0.1)
      scan = {}
      callback = Proc.new do |uuid, major, minor, power, rssi|
        scan = ScanItem.new(uuid, major, minor, power, rssi)
        return scan
      end
      Beacon.startWithTimeInterval(interval,callback)
    end

    callback :completion_function, [:string, :int, :int, :int, :int], :int

    attach_function :startWithTimeInterval, [:double, :completion_function], :void
  end
end
