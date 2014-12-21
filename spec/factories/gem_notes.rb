# == Schema Information
#
# Table name: gem_notes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  version     :string(255)
#  require     :string(255)
#  groups      :string(255)
#  platforms   :string(255)
#  source      :string(255)
#  git         :string(255)
#  github      :string(255)
#  path        :string(255)
#  description :text
#  state       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  branch      :string(255)
#  tag         :string(255)
#  ref         :string(255)
#  submodules  :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gem_note do
  end
end
