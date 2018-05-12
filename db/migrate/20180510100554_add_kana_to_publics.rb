class AddKanaToPublics < ActiveRecord::Migration[5.1]
  def change
    add_column :publics, :kana, :string
  end
end
