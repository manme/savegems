class AddGitPropertiesToGemNotes < ActiveRecord::Migration
  def change
    add_column :gem_notes, :branch, :string
    add_column :gem_notes, :tag, :string
    add_column :gem_notes, :ref, :string
    add_column :gem_notes, :submodules, :string
  end
end
