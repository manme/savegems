class CreateGemNotes < ActiveRecord::Migration
  def change
    # first init migrate by v1.7
    # http://bundler.io/v1.7/man/gemfile.5.html
    # :groups for :group too
    create_table :gem_notes do |t|
      t.string :name
      t.string :version
      t.string :require
      t.string :groups
      t.string :platforms
      t.string :source
      t.string :git
      t.string :github
      t.string :path

      t.text :description
      t.string :state
      t.timestamps
    end
  end
end
