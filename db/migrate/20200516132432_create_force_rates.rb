# frozen_string_literal: true

class CreateForceRates < ActiveRecord::Migration[6.0]
  def change
    create_table :force_rates do |t|
      t.float :rate, null: false
      t.datetime :expire_datetime, null: false
      t.integer :user_id
    end
  end
end
