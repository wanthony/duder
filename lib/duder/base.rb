module Duder
  class Base
    include Resource
    include Associations

    def initialize attributes, loaded_data = true
      @attributes = attributes
      @loaded_data = loaded_data
    end
  end
end
