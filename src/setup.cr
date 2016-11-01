require "./env"
require "option_parser"
require "./recipient_repository"
require "colorize"

parser = OptionParser.new

db_name = ""

parser.on("-c [DB]", "--create [DB]", "create a new contact database called DB") do |provided_name|
  db_name = provided_name
end

parser.parse!

db_name = "barnabas" if db_name.empty?
db_path = File.join(ENV["BARNABAS_HOME"], db_name)

puts "Creating (if required) a db at #{db_path.colorize.yellow}"

repository = RecipientRepository.new(db_path)

repository.create
