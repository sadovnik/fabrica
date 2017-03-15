require 'test_helper'

class Foo
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end
end

describe Fabrica do
  describe '#create' do
    it 'creates factory' do
      foo_factory = Fabrica.create do |b, c|
        Foo.new('A', b, c)
      end

      assert_instance_of Fabrica::Factory, foo_factory

      foo = foo_factory.build('B', 'C')

      assert_equal 'A', foo.a
      assert_equal 'B', foo.b
      assert_equal 'C', foo.c
    end
  end
end
