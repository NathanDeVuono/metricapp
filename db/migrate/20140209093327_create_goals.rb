class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :retail_hrs_per_ro
      t.integer :elr_retail
      t.integer :retail_ro_count
      t.integer :tech_hrs_per_day
      t.integer :salaries_as_percent_gross
      t.integer :other_as_percent_gross
      
      t.timestamps
    end
  end
end
