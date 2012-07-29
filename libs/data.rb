
class Data
  def self.[](key)
    self.data[key]
  end

  def self.[]=(key, value)
    data = self.data
    data[key] = value
    File.open(file, 'w+') do |f|
      f.write data.to_json
    end
  end

  def self.file
    File.expand_path '../data.json', File.dirname(__FILE__)
  end

  def self.data
    data = {}
    File.open(file, 'r') do |f|
      data = JSON.parse f.read rescue data = {}
    end
    data
  end
end

if __FILE__ == $0
  require 'json'
  p Data['whoami']
  Data['whoami'] = `whoami`.strip
  p Data['whoami']
end
