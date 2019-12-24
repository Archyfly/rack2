class TimeFormatter

  FORMATS = ["year", "month", "day", "Hour", "Minutes", "Seconds"]

   def initialize(app)
    @app = app
  end

  def call(env)
    response = Rack::Response.new
    @request = Rack::Request.new(env)

    case @request.path_info
    when /time/
      t = Time.now
      params = @request.params
      params_arr = []

      response.write "This is Rack and params is #{params} <br>"

      # создаем массив из строки запроса, разделитель: запятая.
      # получаем массив значений, которые можем сравнивать с форматом.
      params.each { |key, value|
        params_arr = value.split(%r{,s*})
      }
      response.write "Params_arr FROM array is #{params_arr} <br>"

      array_from_first_letters = []
      params_arr.each { |val|
        if valid_format(val)
          array_from_first_letters.push(val[0])
        else
          array_from_first_letters.push(" Unknown time format #{val}")
        end
      }

      time_string = ""
      response.write "Params array_from_first_letters for strftime:  #{array_from_first_letters} <br>"

      array_from_first_letters.each { |arr|
        time_string = time_string + "%"+arr+"/"
      }

      time_format = Time.now
      time_request_format = time_format.strftime("Printed on #{time_string}")
      response.write "Time from request format:  #{time_request_format} <br>"

    when //
      response.write("Empty response")
    end


    # Set Content-Type
    response['Content-Type'] = "text/html"

    # Set cookie
    response.set_cookie("my_cookie", "Hello my Rack");

    # [status, headers, body]
    response.finish
  end

  def valid_format(val)
     FORMATS.include?(val.to_s)
  end

end

