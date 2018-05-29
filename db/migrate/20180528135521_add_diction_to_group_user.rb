class AddDictionToGroupUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :group_users, :diction, foreign_key: true
  end
end
