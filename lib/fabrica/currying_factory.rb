module Fabrica
  class CurryingFactory
    def initialize(klass, curried_args)
      @klass = klass
      @curried_args = curried_args
    end

    def build(*args)
      @klass.new(*@curried_args, *args)
    end
  end
end
