# frozen_string_literal: true

class CreateTreesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :trees, id: :uuid do |t|
      t.string :common_name
      t.string :scientific_name
      t.text   :content

      t.belongs_to :user, null: false, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
