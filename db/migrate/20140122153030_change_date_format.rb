class ChangeDateFormat < ActiveRecord::Migration
  def change
    remove_column :user_data, :year
    remove_column :user_data, :month

    add_column :user_data, :date, :datetime
  end
end
