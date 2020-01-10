require_relative 'middleware/TimeFormatter'
require_relative 'app'

use Rack::Reloader
run App.new
