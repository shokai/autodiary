# -*- coding: utf-8 -*-
stat = Sys::Filesystem.stat('/')

total = (stat.blocks * stat.block_size).to_f / 1024 / 1024 / 1024
available = (stat.blocks_available * stat.block_size).to_f / 1024 / 1024 / 1024

total = total.to_s.scan(/^(\d+\.\d{0,3})/)[0][0].to_f
available = available.to_s.scan(/^(\d+\.\d{0,3})/)[0][0].to_f
"ディスク 残り#{available}GB空いてる"
