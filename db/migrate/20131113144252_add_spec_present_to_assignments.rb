class AddSpecPresentToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :spec_present, :boolean
  end
end
