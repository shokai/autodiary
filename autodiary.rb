#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.expand_path 'bootstrap', File.dirname(__FILE__)
require 'plugin'

parser = ArgsParser.parse ARGV do
  arg :tweet, 'twitter user name'
  arg :help, 'show help', :alias => :h

  validate :name, "invalid twitter username" do |v|
    v =~ /^[a-zA-Z0-9_]+$/
  end
end

if parser.has_option? :help
  STDERR.puts parser.help
  STDERR.puts "e.g.  ruby #{$0} --tweet shokai"
  exit 1
end

diary = Plugin.list.map{|name|
  begin
    Plugin.exec name
  rescue Plugin::HistoryEmptyException => e
    STDERR.puts e
    exit 1
  rescue Plugin::Error => e
    STDERR.puts e
  end
}.select{|i|
  i
}.sort{|a,b|
  b.to_s <=> a.to_s
}

diary.push ['特に無し。', '何も無し。', '平穏無事。', '何もない日だった。'].sample if diary.empty?

puts hostname = `hostname`.strip.split(/\./)[0]
puts diary

if parser[:tweet]
  name = parser[:tweet] if parser.has_param? :tweet
  client = Tw::Client.new
  client.auth name
  diary.each do |line|
    msg = "[#{hostname}] 今日は#{line}"
    client.tweet msg
  end
end
