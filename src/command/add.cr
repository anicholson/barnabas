module Command
  command "add", "Add a new contact to your list" do |args, repository|
    _name = :missing
    _contact = :missing

    parser = OptionParser.new

    parser.on("-n NAME", "--name NAME", "name of the contact") do |name|
      _name = name.to_s unless name.nil?
    end

    parser.on("-c CONTACT", "--contact CONTACT", "the phone/email of your contact") do |contact|
      _contact = contact.to_s unless contact.nil?
    end

    begin
      parser.parse!
    rescue OptionParser::Exception
      next :FAIL
    end

    if _name == :missing
      puts "You need to provide a name!\n"
      puts parser
      next :FAIL
    end

    if _contact == :missing
      puts "You need to provide a contact!\n"
      puts parser
      next :FAIL
    end

    recipient = Recipient.new(_name.to_s, _contact.to_s, :NEVER)

    repository.add(recipient)
    :OK
  end
end
