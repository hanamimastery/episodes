# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:articles) do
      primary_key :id
      column :title, String
      column :excerpt, String
      column :content, String
      column :thumbnail, String
      foreign_key :author_id, :authors
      column :published_on, Date
    end
  end
end
