struct Recipient
  getter name
  getter contact
  property last_contacted

  NEVER = nil
  BLANK = self.new("", "", NEVER)
  SEPARATOR = "\t\t"

  def initialize(@name : String, @contact : String, @last_contacted : Time?)
  end

  def to_s(io)
    io << name << SEPARATOR << contact << SEPARATOR << last_contacted
  end
end
