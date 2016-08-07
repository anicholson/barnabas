require "sqlite3"
require "./recipient"
require "./creates_database"

class RecipientRepository
  @all : Array(Recipient) | Nil

  def initialize(@dbname : String)
  end

  def all
    @all ||= load
  end

  def fetch(name)
    all.find {|r| r.name == name }
  end

  def add(recipient : Recipient)
    with_db do |db|
      query = "INSERT into contacts (name, contact) VALUES (?, ?)"
      db.exec query, recipient.name, recipient.contact
    end
  end

  def create
    with_db do |db|
      CreatesDatabase.call(db)
    end
  end

  private  getter dbname

  private def load
    all = [] of Recipient
    with_db do |db|
      db.query "SELECT * FROM contacts" do |result_set|

        result_set.each do
          name = result_set.read(String)
          contact = result_set.read(String)
          last_contacted = result_set.read?(Time) || Recipient::NEVER

          all << Recipient.new(name, contact, last_contacted)
        end
      end
    end
    all
  end

  private def with_db(&block)
    DB.open "sqlite3://#{@dbname}" do |db|
      yield db
    end
  end
end
