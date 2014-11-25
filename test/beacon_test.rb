require "test_helper"

describe Hermes::Beacon do
  # ScanItem.new(uuid, major, minor, power, rssi)
  describe 'version' do
    it 'should return the correct gem version number' do
      Hermes::Beacon::VERSION.must_equal "0.0.2"
    end
    
    it 'should return the correct binary version number' do
      Hermes::Beacon.version.must_equal 0
    end
  end
  
  it "should return a distance of 1 when rssi & power are equal" do
    scan = Hermes::Beacon::ScanItem.new("uuid", "major", "minor", -59, -59)
    scan.calculate_distance_from_beacon.must_equal 1.01076
  end
  
  it "should return a distance of 2 when rssi is double power" do
    scan = Hermes::Beacon::ScanItem.new("uuid", "major", "minor", -59, -118)
    scan.calculate_distance_from_beacon.must_equal 2
  end
end