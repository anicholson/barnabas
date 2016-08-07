class CreatesDatabase
  DDL = <<-SQL
      CREATE TABLE IF NOT EXISTS contacts (name string, contact string, last_contacted datetime)
    SQL

  def self.call(connection)
    connection.exec(DDL)
  end
end
