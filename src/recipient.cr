struct Recipient
  include Comparable(Recipient)

  getter name
  getter contact
  property last_contacted

  NEVER     = nil
  BLANK     = self.new("", "", NEVER)
  SEPARATOR = "\t\t"

  def initialize(@name : String, @contact : String, @last_contacted : Time?)
  end

  def <=>(other : Recipient)
    return -1 if last_contacted.nil? && !other.last_contacted.nil?
    return +1 if other.last_contacted.nil? && !last_contacted.nil?
    if other.last_contacted.nil? && last_contacted.nil?
      return name <=> other.name
    else
      return last_contacted.as(Time) <=> other.last_contacted.as(Time)
    end
  end

  def to_s(io)
    io << name << SEPARATOR << contact << SEPARATOR << last_contacted
  end
end
