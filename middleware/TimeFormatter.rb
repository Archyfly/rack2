class TimeFormatter

  FORMATS = ["year", "month", "day", "hour", "min", "sec"]

  def format(params)

    params_arr = []

    params.each { |key, value|
      params_arr = value.split(%r{,w*})
    }

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
