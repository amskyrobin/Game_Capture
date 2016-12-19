require_relative( '../db/sql_runner' )

class Publisher

  attr_reader :id, :name

  def initialize(details) 
    @id = details['id'].to_i
    @name = details['name']
  end

  def save
    sql = "INSERT INTO publishers (name) VALUES ('#{@name}') RETURNING *;"
    publisher_data = SqlRunner.run(sql)
    @id = publisher_data.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM publishers;"
    publishers = SqlRunner.run(sql)
    result = publishers.map {|publisher| Publisher.new(publisher)}
    return result
  end

  def self.find(id)
    sql = "SELECT FROM publishers WHERE id =#{id}"
    publishers = SqlRunner.run(sql)
    result = Publisher.new(publishers.first)
    return result
  end

def self.update(details)
  sql = "UPDATE FROM publishers SET name='#{details['name']}' WHERE id='#{details['id']}'"
  SqlRunner.run(sql)
end

def self.destroy(id)
  sql = "DELETE FROM publishers WHERE id =#{id}"
  SqlRunner.run(sql)
end

def self.delete_all
  sql = "DELETE FROM publishers;"
  SqlRunner.run(sql)
end


end