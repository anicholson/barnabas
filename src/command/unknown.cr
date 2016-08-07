module Command
  command "help", "Print this help" do |args, _repo|
    puts "Known commands:"

    puts Command::Repository.list
    :OK
  end
end
