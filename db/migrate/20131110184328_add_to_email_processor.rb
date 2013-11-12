class AddToEmailProcessor < ActiveRecord::Migration
  def change
    add_column :email_processors, :to, :string
    add_column :email_processors, :from, :string
    add_column :email_processors, :subject, :string
    add_column :email_processors, :body, :string
  end
end
