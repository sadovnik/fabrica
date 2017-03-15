require 'fabrica/version'
require 'fabrica/simple_factory'
require 'fabrica/currying_factory'

module Fabrica
  def self.create(&block)
    SimpleFactory.new(&block)
  end

  def self.create_for(klass, args)
    CurryingFactory.new(klass, args)
  end
end
