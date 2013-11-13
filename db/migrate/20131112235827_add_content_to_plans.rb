class AddContentToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :content, :string
    add_column :plans, :content, :text, :limit => nil
  end
end
