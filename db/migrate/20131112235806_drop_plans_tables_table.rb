class DropPlansTablesTable < ActiveRecord::Migration
  def change
    drop_table :plans_tables
  end
end
