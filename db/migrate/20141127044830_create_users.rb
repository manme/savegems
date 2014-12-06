class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :access_token
      t.string :email
      t.string :hash
      t.timestamps
    end
  end
end
