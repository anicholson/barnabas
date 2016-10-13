module Command
  command "suggest", "suggest someone to contact" do |_args, repository|
    confirmed = Proc(String, Bool).new do |answer|
      answer == "Y" || answer.empty?
    end

    contacts = repository.all.sort

    suggested_contact = contacts.first

    last_contact = suggested_contact.last_contacted

    days = if last_contact == :NEVER
             Float32::INFINITY
           else
             time_since_last_contact = Time.now - last_contact.as(Time)

             time_since_last_contact.total_days.ceil.to_i
           end

    suggestion_message = if last_contact == :NEVER
                           "You haven't sent #{suggested_contact.name} an encouragement before! Would you like to do that now? [Y/n]"
                         else
                           "It's been #{days} day(s) since you last contacted\n#{suggested_contact.name}. Want to send them a quick encouragement now? [Y/n]"
                         end

    print suggestion_message

    answer = gets.as(String).chomp.upcase

    if confirmed.call(answer)
      puts "Type your message to #{suggested_contact.name}, then press ENTER:"

      message_to_send = gets.as(String).strip

      sent_successfully = MessageSender.send(suggested_contact, message_to_send)

      repository.mark_as_contacted(suggested_contact) if sent_successfully
    end

    :OK
  end
end
