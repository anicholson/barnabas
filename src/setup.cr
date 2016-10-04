require "./env"
require "option_parser"
require "./recipients"

parser = OptionParser.new

db_name = ""

parser.on("-c [DB]", "--create [DB]", "create a new contact database called DB") do |provided_name|
  db_name = provided_name
end

parser.parse!

db_name = "barnabas" if db_name.empty?

puts "Creating (if required) a db at #{ENV["BARNABAS_HOME"]}/#{db_name}"

RecipientRepository.new(db_name).create
