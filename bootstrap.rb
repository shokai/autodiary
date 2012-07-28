$:.unshift File.expand_path 'libs', File.dirname(__FILE__) unless $:.include? File.expand_path 'libs', File.dirname(__FILE__)

require 'rubygems'
require 'bundler'
Bundler.require

class Conf
  def self.[](key)
    ENV[key] || conf[key]
  end

  def self.[]=(key,value)
    conf[key] = value
  end

  def self.conf_file
    File.dirname(__FILE__)+'/config.yml'
  end

  def self.conf
    begin
      @@conf ||= YAML::load self.open_conf_file.read
    rescue => e
      STDERR.puts e
      STDERR.puts "config.yml load error!!"
      exit 1
    end
  end

  def self.open_conf_file(opt=nil, &block)
    if block_given?
      yield open(self.conf_file, opt)
    else
      return open(self.conf_file, opt)
    end
  end

  def self.to_yaml
    self.conf.to_yaml
  end
end
