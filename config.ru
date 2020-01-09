require_relative 'middleware/TimeFormatter'
require_relative 'app'

use Rack::Reloader
use TimeFormatter
run App.new
