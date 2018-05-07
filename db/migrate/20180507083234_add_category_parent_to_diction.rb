class AddCategoryParentToDiction < ActiveRecord::Migration[5.1]
  def change
    add_column :dictions, :category_parent, :string
  end
end
