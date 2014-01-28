class ChangeMonthToDateUserDatum < ActiveRecord::Migration
  def change
    change_column :user_data, :month, :date
  end
end
