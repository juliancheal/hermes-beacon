require "hermes_beacon/version"
require "observer"
require "my_group"
require "scan_item"
require "scanner"
require 'rbconfig'

include RbConfig

module Hermes
  module Beacon
  end
end

if CONFIG['host_os'] =~ /mswin|windows|mingw/i
else
  if CONFIG['host_os'] =~ /linux/i
    require 'linux_constants'
  else
    require 'osx_constants'
  end
  require 'beacon_scanner'
end