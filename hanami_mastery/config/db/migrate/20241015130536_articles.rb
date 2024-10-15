# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html for details.
  change do
    create_table :articles do
      primary_key :id
      String :title, null: false
      String :content, null: false
      Integer :status, null: false, default: 0
    end
  end
end
