require "./recipient"

class MessageSender
  SENDER_SCRIPT = "barnabas.applescript"

  def self.send(recipient : Recipient, message : String) : Bool
    script_path = File.join(File.dirname(__FILE__), ".", SENDER_SCRIPT)
    puts "Sending message to #{recipient.name}"
    process = Process.run("osascript", [script_path, "#{recipient.contact}", "#{message}"], nil, false, false, nil, true)

    process.success?
  end
end
