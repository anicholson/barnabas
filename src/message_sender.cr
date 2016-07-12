require "./recipient"

class MessageSender
  SENDER_SCRIPT = <<-APPLESCRIPT
on run argv

  set appName to "Messages"
  set contact to item 1 of argv
  set message to item 2 of argv

  if application appName is not running then
    activate application appName
  end if

  tell application "Messages"
    send message to buddy contact of (service 1 whose service type is iMessage)
    close every window
  end tell
end run

APPLESCRIPT

  def self.send(recipient : Recipient, message : String) : Bool
    puts "Sending message to #{recipient.name}"
    process = Process.run("osascript", ["-", "#{recipient.contact}", "#{message}"], nil, false, false, nil, true) do |p|
      input = p.input

      input << SENDER_SCRIPT

      p.wait
    end

    process.success?
  end
end
