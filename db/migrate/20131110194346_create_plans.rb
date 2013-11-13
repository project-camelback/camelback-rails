class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :content, :limit => 1000
      t.timestamps
    end
  end
end
