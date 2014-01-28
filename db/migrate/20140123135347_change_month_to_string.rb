class ChangeMonthToString < ActiveRecord::Migration
  def change
    change_column :user_data, :month, :string
  end
end
