class CreateGemfiles < ActiveRecord::Migration
  def change
    create_table :gemfiles do |t|
      t.text :content
      t.string :name
      t.string :hashid
      t.references :user

      t.timestamps
    end
  end
end
