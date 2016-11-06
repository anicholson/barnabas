require "option_parser"
require "./env"
require "./library"

recipients = RecipientRepository.new(ENV["BARNABAS_HOME"] + "/" + ENV["BARNABAS_DB"])

def exit_with_code(result : Symbol)
  known_codes = {
    :OK   => 0,
    :FAIL => 1,
  }

  exit_code = begin
    known_codes[result]
  rescue KeyError
    known_codes[:FAIL]
  end

  exit(exit_code)
end

def command_to_run
  command = (ARGV.any? && ARGV.shift) || "help"
end

command = Command::Repository[command_to_run]

result = command.process(ARGV, recipients)

exit_with_code(result)
