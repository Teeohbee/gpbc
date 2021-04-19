class AddSpotlightMonthToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :spotlight_month, :datetime
  end
end
