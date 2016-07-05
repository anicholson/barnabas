require "option_parser"
require "./recipients"

contact = nil
message = ""

recipients = RecipientRepository.new(ENV["HOME"] + "/.barnabas/contacts.toml")

parser = OptionParser.parse! do |parser|
  parser.on("-m MESSAGE", "Message to send") {|msg| message = msg }
  parser.on("-t NAME", "--to=NAME", "Name of the contact to message") {|name| contact = recipients.fetch(name) }
  parser.on("-h", "--help", "Show this help") { puts parser; exit 0 }
end

if contact.nil?
  puts "You need to specify a recipient!"
  error = true
end

if message.empty?
  puts "You need to provide a message!"
  error = true
end

if error
  puts parser
  exit 1
end
