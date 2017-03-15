module Fabrica
  class Factory
    def initialize(&block)
      @block = block
    end

    def build(*args)
      @block.call(*args)
    end
  end
end
