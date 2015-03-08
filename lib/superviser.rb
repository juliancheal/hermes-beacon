$:.unshift File.join(File.dirname(__FILE__))

require "celluloid"
require "scanner"

module Hermes
  module Beacon
    class Superviser < Celluloid::SupervisionGroup
      supervise Hermes::Beacon::Scanner, as: :scanner
    end
  end
end
