#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.expand_path 'bootstrap', File.dirname(__FILE__)
require 'plugin'
require 'tumblr'
require 'args_parser'

parser = ArgsParser.parse ARGV do
  arg :run, 'write blog'
  arg :help, 'show help', :alias => :h,
end

if parser.has_option? :help
  puts parser.help
  puts "e.g.  ruby #{$0} --run"
  exit 1
end

tumblr = Tumblr.new Conf['tumblr']['mail'], Conf['tumblr']['pass']

diary = Plugin.list.map{|name|
  begin
    Plugin.exec name
  rescue Plugin::HistoryEmptyException => e
    STDERR.puts e
    exit 1
  rescue Plugin::Error => e
    STDERR.puts e
  end
}.join "\n"

puts hostname = `hostname`.split(/\./)[0]
puts timestamp = Time.now.strftime('%Y年%m月%d日 %H時%M分')
puts diary

if parser.has_option? :run
  res = tumblr.write_text("#{timestamp} @#{hostname}", diary, "diary,#{hostname}")
  print "post tumblr.com.. "
  puts res =~ /^\d+$/ ? "ok (#{res})" : 'error!'
end
