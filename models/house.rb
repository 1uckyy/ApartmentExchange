# frozen_string_literal: true

require 'sequel'
# model for a schedules datatable
class House < Sequel::Model(:houses)
  one_to_many :flats
  many_to_one :region
end
