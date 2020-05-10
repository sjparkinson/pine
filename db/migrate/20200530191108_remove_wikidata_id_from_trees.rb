class RemoveWikidataIdFromTrees < ActiveRecord::Migration[6.0]
  def change
    remove_column :trees, :wikidata_id, :string
  end
end
