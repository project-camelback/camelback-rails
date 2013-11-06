class CreateMockups < ActiveRecord::Migration
  def change
    create_table :mockups do |t|

      t.timestamps
    end
  end
end
