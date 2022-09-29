# frozen_string_literal: true

# migration to create contacts table
class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name
      t.date :date_of_birth
      t.string :phone
      t.string :address
      t.string :email
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
