#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.expand_path 'bootstrap', File.dirname(__FILE__)
require 'plugin'
require 'tumblr'

tumblr = Tumblr.new Conf['tumblr']['mail'], Conf['tumblr']['pass']

diary = Plugin.list.map{|name|
  Plugin.exec name
}.join("\n")

puts diary

tumblr.write_text('問題なし', diary, 'diary')
