# frozen_string_literal: true

require 'sequel'
# model for a schedules datatable
class Wanted_region < Sequel::Model(:wanted_regions)
  many_to_one :flat
  many_to_one :region
end
