# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:events) do
      primary_key :id
      column :type, String
      column :data, :jsonb
      column :metadata, :jsonb
    end
  end
end
