# frozen_string_literal: true

require 'sequel'
# model for a schedules datatable
class Wanted_floor < Sequel::Model(:wanted_floors)
  many_to_one :flat
end
