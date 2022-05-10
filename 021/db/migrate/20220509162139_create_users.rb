# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:users) do
      primary_key :id
      column :nickname, String
      column :first_name, String
      column :last_name, String
      column :avatar, String
    end
  end
end
