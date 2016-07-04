require "toml"
require "./recipient"

class Recipients
  class << self
    def load(filename : String | File = "$HOME/.barnabas/contacts.toml")
       toml = TOML.parse(filename)
       parse_recipients(toml)
    end

    private

    def parse_recipients(toml) : Hash(String, Recipient)
      recipients = toml["recipients"] as Hash
      return { "Andy": Recipient.new("Andy", "+61402270411")
    end
end


if $0 === __FILE__
  Recipients.load
end
