# frozen_string_literal: true

# jwt denylist migration
class CreateJwtDenylists < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylists, id: :uuid do |t|
      t.string :jti
      t.datetime :exp

      t.timestamps
    end

    add_index :jwt_denylists, :jti
  end
end
