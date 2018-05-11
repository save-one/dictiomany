class AddCategoryParentToPublics < ActiveRecord::Migration[5.1]
  def change
    add_column :publics, :category_parent, :string
  end
end
