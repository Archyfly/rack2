require_relative 'middleware/TimeFormatter'
require_relative 'app'

use TimeFormatter
run App.new
