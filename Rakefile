# frozen_string_literal: true

require 'rubocop/rake_task'
require 'sequel'
require 'json'
require 'date'

RuboCop::RakeTask.new

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_, args|
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect('sqlite://db/exchanges.db') do |db|
      Sequel::Migrator.run(db, 'migrations', target: version)
    end
  end
end

namespace :db do
  desc 'Fill database'
  task :fill_base do |_, _|
    Sequel.connect('sqlite://db/exchanges.db') do |db|
      region_id_one = db[:regions].insert(region_name: 'Leninskiy')
      region_id_two = db[:regions].insert(region_name: 'Zavolzhskiy')
      region_id_three = db[:regions].insert(region_name: 'Kirovskiy')

      house_id_one = db[:houses].insert(street: 'Nekrasova', house_number: 41, type_of_house: 1,
                                        number_of_floors: 5, region_id: region_id_three)
      house_id_two = db[:houses].insert(street: 'Chkalova', house_number: 3, type_of_house: 0,
                                        number_of_floors: 4, region_id: region_id_one)

      flat_id_one = db[:flats].insert(footage: 56.0, number_of_rooms: 3, floor: 2,
                                      price: 1750000.0, exch_price_interval: "500000.0..2000000.0",
                                      exch_footage_interval: "30.0..70.0", exch_number_of_rooms_interval: "2..4",
                                      house_id: house_id_one)

      flat_id_two = db[:flats].insert(footage: 34.0, number_of_rooms: 1, floor: 4,
                                      price: 1250000.0, exch_price_interval: "500000.0..1500000.0",
                                      exch_footage_interval: "30.0..50.0", exch_number_of_rooms_interval: "1..2",
                                      house_id: house_id_two)

      db[:wanted_regions].insert(region_id: region_id_two, flat_id: flat_id_one)
      db[:wanted_regions].insert(region_id: region_id_three, flat_id: flat_id_one)
      db[:wanted_regions].insert(region_id: region_id_one, flat_id: flat_id_two)
      db[:wanted_regions].insert(region_id: region_id_two, flat_id: flat_id_two)

      db[:wanted_floors].insert(number_wanted_floor: 2, flat_id: flat_id_one)
      db[:wanted_floors].insert(number_wanted_floor: 4, flat_id: flat_id_one)
      db[:wanted_floors].insert(number_wanted_floor: 1, flat_id: flat_id_two)
      db[:wanted_floors].insert(number_wanted_floor: 2, flat_id: flat_id_two)
    end
  end
end

namespace :server do
  desc 'Start server'
  task :start do
    filepath = File.expand_path('./db/exchanges.db', __dir__)
    unless File.exist? filepath
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:fill_base'].invoke
    end
    `rerun rackup`
  end
end

task :default do
  Rake::Task['server:start'].invoke
end