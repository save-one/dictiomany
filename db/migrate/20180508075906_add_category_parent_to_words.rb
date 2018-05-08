class AddCategoryParentToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :category_parent, :string
  end
end
