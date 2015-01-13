# == Schema Information
#
# Table name: gemfiles
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string(255)
#  hashid     :string(255)
#  users_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gemfile do
  end
end
