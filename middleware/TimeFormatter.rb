class TimeFormatter

  FORMATS = ["year", "month", "day", "Hour", "Minutes", "Seconds"]

  def initialize
    @params_arr = []
    @correct_params = []
    @unknown_params = []
    @array_from_first_letters = []
  end


  def get_time

    @correct_params.each { |val| @array_from_first_letters.push(val[0]) }

    time_string = ""
    @array_from_first_letters.each { |arr|
      time_string = time_string + "%"+arr+"/"
    }

    time_format = Time.now
    time_request_format = time_format.strftime("Printed on #{time_string}, params_arr is #{@params_arr}, unknown_params is #{@unknown_params}")

  end

  def valid_format?(params)
    params.each { |key, value|
      @params_arr = value.split(%r{,s*})
    }

    @params_arr.each { |value|
      if FORMATS.include?(value.to_s)
        @correct_params << value
      else
        @unknown_params << value
      end
    }

    if @unknown_params == []
      return true
    else
      return false
    end

  end

  def unknown_params
    @unknown_params
  end

end
