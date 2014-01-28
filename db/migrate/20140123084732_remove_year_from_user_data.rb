class RemoveYearFromUserData < ActiveRecord::Migration
  def change
    remove_column :user_data, :year
  end
end
