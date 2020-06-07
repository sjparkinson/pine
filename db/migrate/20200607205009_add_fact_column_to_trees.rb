class AddFactColumnToTrees < ActiveRecord::Migration[6.0]
  def change
    add_column :trees, :fact, :string
  end
end
