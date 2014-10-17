require "hermes/beacon/version"

module Hermes
  module Beacon
    extend FFI::Library

    ffi_lib 'objc', '/System/Library/Frameworks/Foundation.framework/Foundation', '/System/Library/Frameworks/IOBluetooth.framework/IOBluetooth',
    'bin/ibeacon'
    
    attach_function :print_version, [], :void
    callback :completion_function, [:string, :int, :int, :int, :int], :int

    attach_function :startWithTimeInterval, [:double, :completion_function], :void

    def self.scan(interval=1.1)
      scan = {}
      callback = Proc.new do |uuid, major, minor, power, rssi|
        scan = {uuid: uuid, major: major, minor: minor, power: power, rssi: rssi}
        return scan
      end
      Hermes::Beacon.startWithTimeInterval(interval,callback)
    end
  end
end
