class ExtendsUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :nickname, :text
    add_column :users, :image, :text
  end
end
