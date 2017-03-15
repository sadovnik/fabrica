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

      assert_instance_of Fabrica::SimpleFactory, foo_factory

      foo = foo_factory.build('B', 'C')

      assert_equal 'A', foo.a
      assert_equal 'B', foo.b
      assert_equal 'C', foo.c
    end
  end

  describe '#create_for' do
    it 'creates currying factory' do
      foo_factory = Fabrica.create_for(Foo, ['Z', 'G'])

      assert_instance_of Fabrica::CurryingFactory, foo_factory

      foo = foo_factory.build('A')

      assert_equal 'Z', foo.a
      assert_equal 'G', foo.b
      assert_equal 'A', foo.c
    end
  end
end
