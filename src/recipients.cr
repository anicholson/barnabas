require "toml"
require "./recipient"

class RecipientRepository
  @all : Array(Recipient) | Nil

  def initialize(@filepath : String)

  end

  def all
    @all ||= load
  end

  def fetch(name)
    all.find {|r| r.name == name }
  end

  private  getter filepath

  private def load
    toml = TOML.parse_file(filepath)
    parse_recipients(toml)
  end

  private def parse_recipients(toml : TOML::Type) : Array(Recipient)
    recipients = toml["recipients"] as Hash(String, TOML::Type)

    recipients.reduce([] of Recipient) do |ary, contact|
      c = contact.last as Hash
      ary << Recipient.new(c["name"] as String, c["contact"] as String)
    end
  end
end
