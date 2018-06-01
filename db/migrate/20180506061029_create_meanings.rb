class CreateMeanings < ActiveRecord::Migration[5.1]
  def change
    create_table :meanings, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :content
      t.boolean :public_flg, default: false
      t.references :word, foreign_key: true
      t.string :word_name
      t.string :word_category

      t.timestamps
    end
  end
end
