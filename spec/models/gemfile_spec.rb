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

require 'rails_helper'

RSpec.describe Gemfile, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
