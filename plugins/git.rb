# -*- coding: utf-8 -*-
require 'date'
require 'kconv'

day = Date.today-1
h24 = Time.now.to_i-60*60*24
cmds = Hash.new 0

IO.popen("tail -5000 ~/.zsh-history", 'r+') do |io|
  while line = io.gets
    line = line.toutf8
    time, cmd = line.scan(/: (\d+):\d+;(.+)/)[0]
    next if h24 > time.to_i
    git, gitcmd = cmd.split(/\s/)
    next if git != 'git'
    cmds[gitcmd] += 1
  end
end

cmds = cmds.keys.sort{|a,b|
  cmds[b] <=> cmds[a]
}.reject{|name|
  name.to_s.empty? or
  ['status', 'show', 'diff', 'remote', 'log', 'ls-files'].include? name
}.map{|name|
  {:name => name, :count => cmds[name]}
}

case cmds.empty?
when true
  "gitは使ってない"
else
  "gitは"+cmds[0...10].map{|cmd|
    "#{cmd[:name]} #{cmd[:count]}回"
  }.join('、')+"使った"
end
