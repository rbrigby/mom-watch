# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :reset_password_token, unique: true
  end
end



