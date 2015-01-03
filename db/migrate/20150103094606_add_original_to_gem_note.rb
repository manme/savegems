class AddOriginalToGemNote < ActiveRecord::Migration
  def change
    add_column :gem_notes, :original, :string
  end
end
