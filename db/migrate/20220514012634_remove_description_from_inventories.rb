class RemoveDescriptionFromInventories < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventories, :description, :text
  end
end
