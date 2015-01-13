module Hashidable
  extend ActiveSupport::Concern

  included do
    after_create :set_hashid
  end

  protected

  def set_hashid
    update(hashid: Hashids.new(ENV['HASHID_SALT']).encode(id, 6))
  end
end
