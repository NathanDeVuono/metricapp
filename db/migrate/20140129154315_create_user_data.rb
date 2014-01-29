class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.integer :user_id
      t.datetime :month
      t.integer :total_hours_sold
      t.integer :retail_hours_sold
      t.integer :total_labour_sales
      t.integer :retail_labour_sales
      t.integer :work_days_per_tech
      t.integer :number_of_techs
      t.integer :retail_ro_count
      t.integer :total_gross
      t.integer :total_variable_expense
      t.integer :total_salaries

      t.timestamps
    end
  end
end
