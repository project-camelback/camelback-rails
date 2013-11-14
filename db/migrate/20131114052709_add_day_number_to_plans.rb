class AddDayNumberToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :day_number, :integer
  end
end
