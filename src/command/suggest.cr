module Command
  command "suggest", "suggest someone to contact" do |_args, repository|
    contacts = repository.all.sort

    puts contacts.first

    :OK
  end
end
