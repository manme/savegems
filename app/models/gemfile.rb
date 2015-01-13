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

class Gemfile < ActiveRecord::Base
  include Hashidable

  belongs_to :user

  validates :name, presence: true, allow_blank: false
end
