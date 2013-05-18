module Duder
  class Company < Base
    resource_reader :abbreviation, :aliases, :characters, :concepts, :date_added, :date_founded, :developed_games
    resource_reader :developer_releases, :distributor_releases, :location_address, :location_country, :location_state
    resource_reader :locations, :objects, :people, :phone, :published_games, :publisher_releases, :website
  end
end
