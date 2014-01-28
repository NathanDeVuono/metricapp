class AddMonthToUserData < ActiveRecord::Migration
  def change
    add_column :user_data, :month, :integer
    add_column :user_data, :year, :integer
  end
end
