class RemoveDateFromUserData < ActiveRecord::Migration
  def change
    remove_column :user_data, :date
  end
end
