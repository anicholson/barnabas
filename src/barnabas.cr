require "./env"

require "option_parser"
require "./recipients"
require "./message_sender"
require "./command"

recipients = RecipientRepository.new(ENV["BARNABAS_HOME"] + "/" + ENV["BARNABAS_DB"])

def command_to_run
  command = (ARGV.any? && ARGV.shift) || "help"
end

command = Command::Repository[command_to_run]

command.process(ARGV, recipients)

exit(1)
