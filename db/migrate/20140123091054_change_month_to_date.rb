class ChangeMonthToDate < ActiveRecord::Migration
  def change
    change_column :user_data, :month, :datetime
  end
end
