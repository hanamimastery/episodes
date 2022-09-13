# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:articles) do
      primary_key :id
      column :title, String
      column :content, String
      column :status, Integer
      foreign_key :author_id, :authors
      column :published_on, Date
      column :created_at, Time, default: 'now()', null: false
      column :updated_at, Time, default: 'now()', null: false
    end
  end
end
