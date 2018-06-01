class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :reason
      t.references :user, foreign_key: true
      t.references :diction, foreign_key: true
      t.references :word, foreign_key: true
      t.references :meaning, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :deal, default: false

      t.timestamps
    end
  end
end
