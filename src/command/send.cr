module Command
  command "send", "Send a message" do |args, recipients|
    contact = Recipient::BLANK
    message = ""

    parser = OptionParser.new
    parser.on("-m MESSAGE", "Message to send") {|msg| message = msg }

    parser.on("-t NAME", "--to=NAME", "Name of the contact to message") do |name|
      if recipient = recipients.fetch(name)
        contact = recipient
      end
    end

    parser.on("-h", "--help", "Show this help") { puts parser; exit 0 }

    begin
      parser.parse!
    rescue e : OptionParser::Exception
      puts e.message
      puts parser

      exit 1
    end

    if contact == Recipient::BLANK
      puts "You need to specify a recipient!"
      error = true
    end

    if message.empty?
      puts "You need to provide a message!"
      error = true
    end

    if error
      puts parser
      next :FAIL
    end

    MessageSender.send(contact, message)

    :OK
  end
end
