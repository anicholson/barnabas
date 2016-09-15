module Command
  command "list", "List your contacts" do |args, repository|
    recipients = repository.all || :NONE

    if recipients == :NONE
      puts "You haven't added any contacts! Add one with `barnabas add`"
      next :OK
    else
      puts "Name#{Recipient::SEPARATOR}Contact#{Recipient::SEPARATOR}Last Contacted"
      recipients.as(Array(Recipient)).each do |recipient|
        puts recipient
      end
    end

    :OK
  end
end
