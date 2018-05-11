class AddDefaultPublicFlgToDictions < ActiveRecord::Migration[5.1]
  def change
    add_column :dictions, :default_public_flg, :boolean, default: false, null: false
  end
end
