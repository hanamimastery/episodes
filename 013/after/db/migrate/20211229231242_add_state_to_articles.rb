# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table(:articles) do
      add_column :state, String, default: 'draft'
    end
  end
end
