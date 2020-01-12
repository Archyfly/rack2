class TimeFormatter

  FORMATS = ["year", "month", "day", "Hour", "min", "seconds"]

  def format(params)

    params_arr = []
      # params.split(%r{,s*})
      #response.write ("params_arr = #{params_arr}")

      # создаем массив из строки запроса, разделитель: запятая.
      # получаем массив значений, которые можем сравнивать с форматом.
    params.each { |key, value|
      params_arr = value.split(%r{,s*})
    }

    #array_from_first_letters = []
    #  params_arr.each { |val|
    #      array_from_first_letters.push(val[0])
    #    if valid_format?(val)
    #    else
    #      array_from_first_letters.push(" Unknown format #{val} ")
    #    end
    #  }

    # time_string = ""
    # array_from_first_letters.each { |arr|
    #   time_string = time_string + "%"+arr+"/"
    # }

    # time_format = Time.now
    # time_request_format = time_format.strftime("Printed on #{time_string}, params is #{params}, params_arr is #{params_arr}")
    @t = ''
    params_arr.each { |val|
      if valid_format?(val)
        @t = ("#{@t} #{Time.now.send(val)}")
      else
        @t = ("#{@t} Unknown format: #{val}")
      end
      }
    return @t.to_s
  end

  def time_res(params)
    Time.send(params)
  end

  def valid_format?(val)
    FORMATS.include?(val.to_s)
  end

end
