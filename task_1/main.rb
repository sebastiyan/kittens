class Controller

  def call
    action
    @response_text
  end

  def action
    @response_text = ''
  end

end

class Router

  def initialize(routes)
    @routes = routes
  end

  def call(env)
    path = @routes[env['PATH_INFO']]

    unless path
      [404, {}, ['not found']]
    else
      response = path.new
      [200, {}, [response.call]]
    end

  end
end
