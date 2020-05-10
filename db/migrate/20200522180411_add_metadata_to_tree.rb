class AddMetadataToTree < ActiveRecord::Migration[6.0]
  def change
    add_column :trees, :wikidata_id, :string
    add_column :trees, :openstreetmap_node, :bigint
  end
end
