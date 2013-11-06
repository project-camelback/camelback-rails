class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :last_login

      t.timestamps
    end
  end
end
