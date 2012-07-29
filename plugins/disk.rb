# -*- coding: utf-8 -*-
stat = Sys::Filesystem.stat('/')

total = (stat.blocks * stat.block_size).to_f / 1024 / 1024 / 1024
total = total.to_s.scan(/^(\d+\.\d{0,3})/)[0][0].to_f

available = (stat.blocks_available * stat.block_size).to_f / 1024 / 1024 / 1024
available = available.to_s.scan(/^(\d+\.\d{0,3})/)[0][0].to_f

diff = available - (Data['disk_available'] or available)
diff = diff.to_s.scan(/^(-?\d+\.\d{0,3})/)[0][0].to_f
Data['disk_available'] = available

diary = 'HDD'
if diff > 0.01
  diary += "の空き容量 #{diff}GB増えた。"
elsif -0.01 > diff
  diary += "#{diff*-1}GB使った。"
end

diary += "残り#{available}GB空いてる"
diary
