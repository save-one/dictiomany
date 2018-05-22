class ChangeDatatypeDealOfReports < ActiveRecord::Migration[5.1]
  def change
  	change_column :reports, :deal, :string
  end
end
