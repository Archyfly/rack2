require_relative 'middleware/TimeFormatter'

class App
  def initialize
    @formatter = TimeFormatter.new
  end

  def call(env)
    path = env['PATH_INFO']
    @request = Rack::Request.new(env)


    if path != '/time'
      return [404, headers, ['Not found']]
    else
      process_params
    end
  end

  def process_params
    formatter = TimeFormatter.new

    if formatter.valid_format?(@request.params) # нет неизвестных форматов
      response_with(200, formatter.get_time)
    else
      response_with(400, formatter.unknown_params)
    end
  end

  def response_with(code, answer)
    response = Rack::Response.new(answer.to_s,
    code,
    'Content-Type' => 'application-json',
    )
  end

private

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

end
