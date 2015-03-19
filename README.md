# Elo4m

### Elo for Multi Player Games

From [Wikipedia](http://en.wikipedia.org/wiki/Elo_rating_system):

The Elo rating system is a method for calculating the relative skill levels of
players in two-player games such as chess and Go. It is named after its creator
Arpad Elo, a Hungarian-born American physics professor.

But Elo was designed for two player games.
This is for multi player games.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elo4m'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elo4m

## Usage

```ruby
# :rating => player's rating before game.
# :rank => game result. if you win first prize, this is 1.
# :new_rating => new rating applied elo raitng.

players = [
  Elo4m::Player.new(:rating, :rank),
  Elo4m::Player.new(:rating, :rank)
]
game = Elo4m::Game.new(players)
game.run
  #=> [:new_rating, :new_rating]  
```

## Example

```ruby
players = [
  Elo4m::Player.new(1613, 4),
  Elo4m::Player.new(1609, 2),
  Elo4m::Player.new(1477, 4),
  Elo4m::Player.new(1388, 6),
  Elo4m::Player.new(1586, 5),
  Elo4m::Player.new(1720, 1)
]
game = Elo4m::Game.new(players)
game.run
  #=> [1601, 1646, 1499, 1350, 1533, 1762]  
```

## K-factor

Set your config if you want.

`config/initializers/elo4m.rb.`

```ruby
Elo4m.configure do |c|
  c.k_factor = <K-FACTOR>
end
```

## Contributing

1. Fork it ( https://github.com/kidach1/elo4m/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
