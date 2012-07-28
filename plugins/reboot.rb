# -*- coding: utf-8 -*-

count = 0
IO.popen("last reboot | grep '^reboot '", 'r+') do |io|
  while line = io.gets
    params = line.split(/\s+/)
    case RUBY_PLATFORM
    when /darwin/
      now = Time.now
      unless params[-2] == now.day and
          params[-3] == now.strftime('%b')
        next
      end
    end
    p params
    count += 1
  end
end

return "" if count < 1
"#{count}回再起動した"
