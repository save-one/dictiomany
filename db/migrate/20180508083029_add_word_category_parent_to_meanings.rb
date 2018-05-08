class AddWordCategoryParentToMeanings < ActiveRecord::Migration[5.1]
  def change
    add_column :meanings, :word_category_parent, :string
  end
end
