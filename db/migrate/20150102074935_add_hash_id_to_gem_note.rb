class AddHashIdToGemNote < ActiveRecord::Migration
  def change
    add_column :gem_notes, :hashid, :string
  end
end
