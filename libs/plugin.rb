
module Plugin
  class Error < StandardError
  end
  class HistoryEmptyException < Exception
  end

  @@plugins = {}
  Dir.glob(File.expand_path '../plugins/*.rb', File.dirname(__FILE__)).each do |rb|
    name = rb.scan(/([^\/]+)\.rb$/)[0][0]
    File.open(rb) do |f|
      @@plugins[name] = f.read
    end
  end

  def self.list
    @@plugins.keys
  end

  def self.exec(name)
    class_eval @@plugins[name]
  end
end

if $0 == __FILE__
  p Plugin.list
  p Plugin.exec(Plugin.list[0])
end
