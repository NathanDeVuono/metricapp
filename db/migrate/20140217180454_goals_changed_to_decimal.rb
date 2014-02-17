class GoalsChangedToDecimal < ActiveRecord::Migration
  def change
    change_column :goals, :retail_hrs_per_ro, :decimal
    change_column :goals, :elr_retail, :decimal
    change_column :goals, :retail_ro_count, :decimal
    change_column :goals, :tech_hrs_per_day, :decimal
    change_column :goals, :salaries_as_percent_gross, :decimal
    change_column :goals, :other_as_percent_gross, :decimal

  end
end
