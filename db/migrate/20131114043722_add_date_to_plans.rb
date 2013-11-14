class AddDateToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :date, :string
  end
end
