class AddUserIdToGemNote < ActiveRecord::Migration
  def change
    add_column :gem_notes, :user_id, :integer
  end
end
