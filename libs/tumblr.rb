require 'rubygems'
require 'httpclient'
require 'uri'

class Tumblr
  
  def initialize(mail, pass)
    @mail = mail
    @pass = pass
  end

  def write_photo(filename, caption, tags="")
    open(filename){|file|
      postdata = {
        'email' => @mail,
        'password' => @pass,
        'type' => 'photo',
        'state' => 'published', # published, queue, draf
        'data' => file,
        'caption' => caption,
        'tags' => tags
      }
      HTTPClient.new.post_content('http://www.tumblr.com/api/write', postdata)
    }
  end

  def write_text(title, body, tags="")
    postdata = {
      'email' => @mail,
      'password' => @pass,
      'type' => :regular,
      'state' => :published,
      'title' => title,
      'body' => body,
      'tags' => tags
    }
    HTTPClient.new.post_content('http://www.tumblr.com/api/write', postdata)
  end

end
