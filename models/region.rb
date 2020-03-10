# frozen_string_literal: true

require 'sequel'
# model for a schedules datatable
class Region < Sequel::Model(:regions)
  one_to_many :houses
  one_to_many :wanted_regions
end

