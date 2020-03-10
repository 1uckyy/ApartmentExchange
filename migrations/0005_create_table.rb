# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:wanted_regions) do
      primary_key :id
      foreign_key :region_id, :regions, null: false
      foreign_key :flat_id, :flats, null: false
    end
  end
end
