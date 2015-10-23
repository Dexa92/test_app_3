namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Country, Region, City, Turbaza].each(&:delete_all)

    ActiveRecord::Base.transaction do
      Country.populate 5 do |country|
        country.name = Faker::Address.country
        Region.populate 1..2 do |region|
          region.country_id = country.id
          region.name = Faker::Address.state
          City.populate 1..2 do |city|
            city.region_id = region.id
            city.name = Faker::Address.city
            Turbaza.populate 1..2 do |turbaza|
              turbaza.city_id = city.id
              turbaza.name = Populator.words(1..3).titleize
            end
          end
        end
      end
    end
  end
end