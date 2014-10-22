require "test_helper"

describe Hermes::Beacon do
  describe 'version' do
    it 'should return the correct gem version number' do
      Hermes::Beacon::VERSION.must_equal "0.0.1"
    end
    
    it 'should return the correct binary version number' do
      Hermes::Beacon.version.must_equal 0
    end
  end
end