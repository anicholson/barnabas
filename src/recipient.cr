struct Recipient
  getter name
  getter contact

  BLANK = self.new("", "")

  def initialize(@name : String, @contact : String)
  end
end
