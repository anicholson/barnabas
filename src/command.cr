require "./command/repository"
require "./command/base"

module Command
def self.capture(&block : Array(String), RecipientRepository -> Symbol)
  block
end

macro command(name, description, &action)
  %action  = Command.capture {{action}}
  %command = Command::Base.new({{name}}, {{description}}, %action)

  Command::Repository.register({{name}}, %command)
end

end

require "./command/unknown"
require "./command/add"
require "./command/list"
require "./command/send"
