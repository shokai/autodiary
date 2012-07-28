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
    cmds[cmd.split(/\s/)[0]] += 1
  end
end

cmds = cmds.keys.sort{|a,b|
  cmds[b] <=> cmds[a]
}.map{|name|
  {:name => name, :count => cmds[name]}
}

raise HistoryEmptyException, 'history is empty' if cmds.empty?
cmds[0...5].map{|cmd|
  "#{cmd[:name]} #{cmd[:count]}回"
}.join('、')+"実行しました"
