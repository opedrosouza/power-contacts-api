# frozen_string_literal: true

# migration to create contact_files table
class CreateContactFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_files, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.integer :status
      t.jsonb :rows_with_errors

      t.timestamps
    end
  end
end
