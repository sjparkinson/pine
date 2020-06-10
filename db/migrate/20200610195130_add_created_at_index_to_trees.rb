class AddCreatedAtIndexToTrees < ActiveRecord::Migration[6.0]
  def change
    add_index :trees, :created_at
  end
end
