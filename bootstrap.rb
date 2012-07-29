$:.unshift File.expand_path 'libs', File.dirname(__FILE__) unless $:.include? File.expand_path 'libs', File.dirname(__FILE__)

require 'rubygems'
require 'bundler'
Bundler.require
require 'conf'
