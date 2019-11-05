class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      item = @@items.find{|s| s.title == item_title}

      resp.write item.artist
    end

    resp.finish
  end
end
