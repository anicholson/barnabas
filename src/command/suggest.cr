module Command
  command "suggest", "suggest someone to contact" do |_args, repository|
    contacts = repository.all.sort

    suggested_contact = contacts.first

    last_contact = suggested_contact.last_contacted

    days = if last_contact == :NEVER
             Float32::INFINITY
           else
             time_since_last_contact = Time.now - last_contact.as(Time)

             time_since_last_contact.total_days.ceil.to_i
           end

    message = if last_contact == :NEVER
                "You haven't sent #{suggested_contact.name} an encouragement before! Would you like to do that now?"
              else
                "It's been #{days} day(s) since you last contacted\n#{suggested_contact.name}. Want to send them a quick encouragement now?"
              end

    puts message

    :OK
  end
end
