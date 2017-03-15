require 'test_helper'

class Point
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x, @y, @z = x, y, z
  end

  def to_a
    [@x, @y, @z]
  end
end

describe Fabrica do
  describe '#create' do
    it 'creates factory' do
      point_factory = Fabrica.create do |x, y|
        Point.new(x, y, 0)
      end

      assert_instance_of Fabrica::SimpleFactory, point_factory

      point = point_factory.build(10, 20)

      assert_equal [10, 20, 0], point.to_a
    end
  end

  describe '#create_for' do
    it 'creates currying factory' do
      point_factory = Fabrica.create_for(Point, [5, 7])

      assert_instance_of Fabrica::CurryingFactory, point_factory

      point = point_factory.build(-15)

      assert_equal [5, 7, -15], point.to_a
    end
  end
end
