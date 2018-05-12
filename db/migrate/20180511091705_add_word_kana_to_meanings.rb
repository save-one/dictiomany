class AddWordKanaToMeanings < ActiveRecord::Migration[5.1]
  def change
    add_column :meanings, :word_kana, :string
  end
end
