# Factorymethods

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factorymethods'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factorymethods

## Usage

```ruby
# Define factory class with static factory methods
class Humanoid
  # add ability to use deffactory macro
  extend FactoryMethods

  # Define necessary static factories
  deffactory :call
  deffactory :shout
  deffactory :make_some

  # define instance relevant methods
  def initialize(thing)
    @thing = thing
  end

  def call
    puts 'CALL 911!'
  end

  def make_some
    puts "CRAFTING #{@thing}""
  end

  def shout(&block)
    puts "SHOUT: #{block.call}"
  end
end

# Use your factories

# without arguments
Humanoid.call
# => CALL 911!

# with block
Humanoid.shout { "humanoid instance says 'HELLO'" }
# => SHOUT: humanoid instance says 'HELLO'

# with arguments, passed to constructor
Humanoid.make_some(:coffee)
# => CRAFTING coffee

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/o-kurnenkov/factorymethods.

