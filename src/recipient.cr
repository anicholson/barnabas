struct Recipient
  getter name
  getter contact

  NEVER = :NEVER
  BLANK = self.new("", "", NEVER)

  def initialize(@name : String, @contact : String, @last_contacted : Symbol | Time)
  end
end
