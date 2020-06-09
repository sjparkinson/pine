class RemoveOpenstreetmapNodeFromTrees < ActiveRecord::Migration[6.0]
  def change
    remove_column :trees, :openstreetmap_node, :bigint
  end
end
