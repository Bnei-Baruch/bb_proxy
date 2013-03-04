require 'rack-proxy'

class AppProxy < Rack::Proxy
  def rewrite_env(env)
    request = Rack::Request.new(env)
    if request.path =~ %r{^/player}
      env["HTTP_HOST"] = "localhost:9292"
    else
      env["HTTP_HOST"] = "localhost:3001"
    end
    env
  end
end

run AppProxy.new
