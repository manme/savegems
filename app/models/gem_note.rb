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
#  hashid      :string(255)
#  original    :string(255)
#  user_id     :integer
#

class GemNote < ActiveRecord::Base
  include Hashidable

  belongs_to :user

  acts_as_taggable

  validates :original, presence: true, allow_blank: false

  def active=(val)
    if val.to_i.zero?

      self.state = :disactived
    else
      self.state = :actived
    end
  end

  state_machine :state, initial: :active do
    event :disactive do
      transition actived: :disactived
    end

    event :active do
      transition disactived: :actived
    end
  end
end
