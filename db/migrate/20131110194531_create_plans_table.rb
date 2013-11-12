class CreatePlansTable < ActiveRecord::Migration
  def change
    create_table :plans_tables do |t|
      t.string :header
      t.string :content
    end
  end
end
