class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :email, :string
    #add_column :students, :password_hash, :string
    add_column :students, :github_username, :string
    add_column :students, :semester, :string
  end
end
        # create_table(:admins) do
    #   primary_key :id
    #   String :first_name
    #   String :last_name
    #   String :password_hash
    #   String :email
    # end
