require 'fabrica/version'
require 'fabrica/factory'

module Fabrica
  def self.create(&block)
    Factory.new(&block)
  end
end
