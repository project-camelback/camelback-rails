class AddIssuesToHomework < ActiveRecord::Migration
  def change
    add_column :homeworks, :current_issue, :string
  end
end
