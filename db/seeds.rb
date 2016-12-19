require_relative( '../models/game.rb' )
require_relative( '../models/publisher.rb' )
require('pry')

Publisher.delete_all
Game.delete_all

publisher1 = Publisher.new({
  'name' => 'EA'
  })

publisher1.save

publisher2 = Publisher.new({
  'name' => 'Bethesda'
  })

publisher2.save

publisher3 = Publisher.new({
  'name' => 'Square Enix'
  })

publisher3.save

publisher4 = Publisher.new({
  'name' => 'Capcom'
  })

publisher4.save

publisher5 = Publisher.new({
  'name' => 'Namco'
  }) 

publisher5.save

game1 = Game.new({
  'name' => 'TimeSplitters: Future Perfect',
  'stock_level' => 'medium',
  'quantity' => 19,
  'publisher_id' => publisher1.id
})

game1.save

game2 = Game.new({
  'name' => 'Fallout 4',
  'stock_level' => 'high',
  'quantity' => 31,
  'publisher_id' => publisher2.id 
  })

game2.save

game3 = Game.new({
  'name' => 'Final Fantasy X',
  'stock_level' => 'low',
  'quantity' => 4,
  'publisher_id' => publisher3.id
  })

game3.save

game4 = Game.new({
  'name' => 'Resident Evil 4',
  'stock_level' => 'medium',
  'quantity' => 18,
  'publisher_id' => publisher4.id
  })

game4.save

game5 = Game.new({
  'name' => 'Tekken Tag Tournament',
  'stock_level' => 'low',
  'quantity' => 2,
  'publisher_id' => publisher5.id
  })

game5.save

binding.pry 

nil