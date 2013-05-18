module Duder
  class Character < Base
    resource_reader :aliases, :birthday, :concepts, :enemies, :first_appeared_in_game, :franchises, :friends, :games, :gender, :last_name
    resource_reader :locations, :objects, :people, :real_name

    has_many :friends, class_name: :character
    has_many :enemies, class_name: :character
  end
end
