class ChangeDealOfReports < ActiveRecord::Migration[5.1]
  def self.up
  	change_column :reports, :deal, :string, default: nil
  end

  def self.down
  	change_column :reports, :deal, :string, default: "f"
  end
end
