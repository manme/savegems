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
#

class GemNote < ActiveRecord::Base

  def active
    state == :actived
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
