require_relative( '../db/sql_runner' )
require('pry')

class Game

  attr_reader :id, :name, :stock_level, :quantity, :publisher_id

  def initialize(details)
    @id = details['id'].to_i 
    @name = details['name']
    @stock_level = details['stock_level']
    @quantity = details['quantity'].to_i
    @publisher_id = details['publisher_id'].to_i

  end

def save
 sql = "INSERT INTO games (name, stock_level, quantity, publisher_id) VALUES ('#{@name}', '#{@stock_level}', #{@quantity}, #{@publisher_id}) RETURNING *;"
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
  sql = "UPDATE games SET name='#{ details['name'] }', stock_level='#{ details['stock_level'] }', quantity='#{ details['quantity'] }', publisher_id='#{ details['publisher_id'] }'
      WHERE id='#{ details['id'] }'"
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



end
