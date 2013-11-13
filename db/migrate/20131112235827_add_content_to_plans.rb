class AddContentToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :content, :blob
  end
end
