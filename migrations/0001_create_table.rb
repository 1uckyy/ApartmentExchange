# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:flats) do
      primary_key :id
      Double :footage, null: false
      Integer :number_of_rooms, null: false
      Integer :floor, null: false
      Double :price, null: false
      String :exch_price_interval, null: false
      String :exch_footage_interval, null: false
      String :exch_number_of_rooms_interval, null: false
      foreign_key :house_id, :houses, null: false
    end
  end
end
