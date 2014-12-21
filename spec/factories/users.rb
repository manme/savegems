# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  uid          :string(255)
#  provider     :string(255)
#  access_token :string(255)
#  email        :string(255)
#  utoken       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  name         :text
#  nickname     :text
#  image        :text
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  end
end
