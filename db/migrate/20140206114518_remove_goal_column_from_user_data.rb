class RemoveGoalColumnFromUserData < ActiveRecord::Migration
  def change
    remove_column :user_data, :goal
  end
end
