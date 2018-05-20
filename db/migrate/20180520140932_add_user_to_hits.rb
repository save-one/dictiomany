class AddUserToHits < ActiveRecord::Migration[5.1]
  def change
    add_reference :hits, :user, foreign_key: true
  end
end
