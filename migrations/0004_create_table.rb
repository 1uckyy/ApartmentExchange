# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:wanted_floors) do
      primary_key :id
      Integer :number_wanted_floor, null: false
      foreign_key :flat_id, :flats, null: false
    end
  end
end
