require "toml"
require "./recipient"

class Recipients
  def self.load(filename : String | File = "#{ENV["HOME"]}/.barnabas/contacts.toml")
       toml = TOML.parse_file(filename)
       parse_recipients(toml)
    end

    private def self.parse_recipients(toml : TOML::Type) : Hash(String, Recipient)
      recipients = toml["recipients"] as Hash

      all_recipients = {} of String => Recipient
      recipients.each do |name, contact|
        puts (typeof(contact))
        all_recipients[name] = Recipient.new(contact["name"], contact["contact"])
      end
      all_recipients
    end
end

puts Recipients.load
