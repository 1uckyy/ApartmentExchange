# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:houses) do
      primary_key :id
      String :street, null: false, size: 100
      Integer :house_number, null: false
      Integer :type_of_house, null: false, size: 1
      Integer :number_of_floors, null: false
      foreign_key :region_id, :regions, null: false
    end
  end
end
