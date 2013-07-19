require "rickroll/version"

module Rickroll
  def self.path
    File.expand_path('../../site/index.html', __FILE__)
  end
  def self.open_with_launchy
    require 'launchy'
    Launchy.open(path)
  end
  def self.open_with_safari
    `open -a Safari #{path.inspect}`
  end
  def self.has_open?
    `which open`
    return false unless $?.success?
    `open --help 2>&1`.include? 'Opens with the specified application'
  end
  def self.open
    has_open? ? open_with_safari : open_with_launchy
  end
end

def Rickroll
  Rickroll.open
end

