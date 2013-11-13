class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :login
      t.string :gravatar_url

      t.timestamps
    end
  end
end
