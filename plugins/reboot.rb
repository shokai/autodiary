# -*- coding: utf-8 -*-

count = 0
IO.popen("last reboot | grep '^reboot '", 'r+') do |io|
  while line = io.gets
    params = line.split(/\s+/)
    case RUBY_PLATFORM
    when /darwin/
      now = Time.now
      unless params[-2] == now.day.to_s and
          params[-3] == now.strftime('%b')
        next
      end
    when /linux/
      now = Time.now
      unless params[6] == now.day.to_s and
          params[5] == now.strftime('%b')
        next
      else
      end
    else
      next
    end
    count += 1
  end
end

return nil if count < 1
"#{count}回再起動した"
