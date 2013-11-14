class AddGradingColumnsToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :evaluated, :boolean
    add_column :homeworks, :examples, :integer
    add_column :homeworks, :passes, :integer
    add_column :homeworks, :pendings, :integer
    add_column :homeworks, :failures, :integer
    add_column :homeworks, :failure_descriptions, :string
    add_column :homeworks, :evaluation_date, :string
  end
end
