# Fabrica

Allows you to create simple factories.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fabrica'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fabrica

## Usage

Suppose we have a `Point` class:

```ruby
class Point
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x, @y, @z = x, y, z
  end
end
```

And we want to produce instances of it with pre-configured `x` value.

### `#create`
```ruby
point_factory = Fabrica.create do |y, z|
  Point.new(0, y, z)
end

point = point_factory.build(10, 20)
# => #<Point:0x007fdac1681ca0 @x=0, @y=10, @z=20>
```

### `#create_for`
Alternatively, you can achieve the same effect using `#create_for` but without having to explicitly specify the factory method.
```ruby
point_factory = Fabrica.create_for(Point, [5, 7])

point = point_factory.build(-15)
# => #<Point:0x007fdac1660230 @x=5, @y=7, @z=-15>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sadovnik/fabrica. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

