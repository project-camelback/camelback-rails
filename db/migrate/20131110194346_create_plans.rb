class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :content, :varchar(2000)
      t.timestamps
    end
  end
end
