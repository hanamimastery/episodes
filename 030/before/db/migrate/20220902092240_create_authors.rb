# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:authors) do
      primary_key :id
      column :first_name, String
      column :last_name, String
      column :nickname, String, null: false, unique: true
    end
  end
end
