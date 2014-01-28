class UserDatum < ActiveRecord::Base
  validates :month, presence: true
  validates :total_hours_sold, presence: true
  validates :retail_hours_sold, presence: true
  validates :total_labour_sales, presence: true
  validates :retail_labour_sales, presence: true
  validates :work_days_per_tech, presence: true
  validates :number_of_techs, presence: true
  validates :retail_ro_count, presence: true
  validates :total_gross, presence: true
  validates :total_variable_expense, presence: true
  validates :total_salaries, presence: true
  validates :user_id, presence:true



end
