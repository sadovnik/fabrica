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

```ruby
class Foo
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end
end

foo_factory = Fabrica.create do |b, c|
  Foo.new('A', b, c)
end
# => #<Fabrica::SimpleFactory:0x007fd48b0487f8 @block=#<Proc:0x007fd48b048820@:8>>

foo = foo_factory.build('B', 'C')
# => #<Foo:0x007fd48b0317d8 @a="A", @b="B", @c="C">

foo.a
# => "A"
foo.b
# => "B"
foo.c
# => "C"

# alternatively, you can achieve the same effect using `#create_for`
# but without having to explicitly specify the factory method

foo_factory = Fabrica.create_for(Foo, ['A'])
# => #<Fabrica::CurryingFactory:0x007f8d84f88f40 @klass=Foo, @curried_args=["A"]>

foo_factory.build('Y', 'Z')
# => #<Foo:0x007f8d84f711b0 @a="A", @b="Y", @c="Z">

foo.a
# => "A"
foo.b
# => "Y"
foo.c
# => "Z"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sadovnik/fabrica. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

