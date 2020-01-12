require_relative 'middleware/TimeFormatter'
require_relative 'format_error'

class App
  def initialize
    @formatter = TimeFormatter.new
  end

  def call(env)
    path = env['PATH_INFO']
    request = Rack::Request.new(env)
    response = Rack::Response.new

    if path != '/time'
      return [404, headers, ["Not found, #{path}, #{request}, #{request.params}"]]
    end

    begin
      value = request.params
      result = @formatter.format(value)
      #result = 'new result'
      return [200, headers, [result]]
    rescue FormatError
      return [400, headers, ['Incorrect input format']]
    end
  end

private

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

end
