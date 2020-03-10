# frozen_string_literal: true

require 'sequel'
require_relative 'flat'
# model for a flats datatable
class Flat < Sequel::Model(:flats)
  many_to_one :house
  one_to_many :wanted_floors
  one_to_many :wanted_regions

  def self.search_by(search, selection)
    case selection
    when 'Фамилии'
      where(Sequel[:footage].like("#{search}%"))
    when 'Имени'
      where(Sequel[:floor].like("#{search}%"))
    end
  end
end
