class AddDateToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :date, :string
    add_column :plans, :day_number, :integer
  end
end
