class AddGoalColToUserData < ActiveRecord::Migration
  def change
    add_column :user_data, :goal, :integer
  end
end
