# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:regions) do
      primary_key :id
      String :region_name, null: false, size: 100
    end
  end
end
