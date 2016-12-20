require_relative( '../db/sql_runner' )
require('pry')

class Game

  attr_reader :id, :name, :quantity, :publisher_id

  def initialize(details)
    @id = details['id'].to_i 
    @name = details['name']
    @quantity = details['quantity'].to_i
    @publisher_id = details['publisher_id'].to_i

  end

def save
 sql = "INSERT INTO games (name, quantity, publisher_id) VALUES ('#{@name}', #{@quantity}, #{@publisher_id}) RETURNING *;"
 game_data = SqlRunner.run(sql)
 @id = game_data.first['id'].to_i
end

def self.all
  sql = "SELECT * FROM games;"
  games = SqlRunner.run(sql)
  result = games.map {|game| Game.new(game)}
  return result 
end

def self.find(id)
  sql = "SELECT * FROM games WHERE id = #{id};"
  game = SqlRunner.run(sql)
  return Game.new(game.first)
end 

def self.update(details) 
  sql = "UPDATE games SET name='#{ details['name'] }', quantity='#{ details['quantity'] }', publisher_id='#{ details['publisher_id'] }'
      WHERE id='#{ details['id'] }';"
      SqlRunner.run(sql)
end 

  def self.destroy(id)
    sql = "DELETE FROM games WHERE id =#{id}"
    SqlRunner.run(sql)
  end

def self.delete_all
  sql = "DELETE FROM games;"
  SqlRunner.run(sql)
end

def publisher()
  sql = "SELECT * FROM publishers WHERE id = #{@publisher_id};"
  result = SqlRunner.run( sql ).first
  # binding.pry
  return Publisher.new( result )
end

  def update()
    sql = "UPDATE games SET (name, quantity, publisher_id) = ('#{@name}', #{@quantity}, #{@publisher_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

def stock_level()
  medium = (15..29).to_a
  low = (1..14).to_a
  if @quantity > medium.last  
    return "high"
  elsif medium.include?(@quantity)
    return "medium"
  elsif low.include?(@quantity)
    return "low"
  else 
    return "out of stock" 
  end
end

def quantity
  sql = "SELECT * FROM games WHERE id = #{@id};"
  result = SqlRunner.run(sql).first['quantity']
  return result 
end


end

