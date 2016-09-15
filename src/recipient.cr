struct Recipient
  getter name
  getter contact
  getter last_contacted

  NEVER = :NEVER
  BLANK = self.new("", "", NEVER)
  SEPARATOR = "\t\t"

  def initialize(@name : String, @contact : String, @last_contacted : Symbol | Time)
  end

  def to_s(io)
    io << name << SEPARATOR << contact << SEPARATOR << last_contacted
  end
end
