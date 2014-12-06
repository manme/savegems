class UserRepository
  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def authenticate


    user = User.find_or_create_by(uid: @auth_hash['uid'], provider: @auth_hash['provider'])
    first_name = @auth_hash.info['first_name']
    last_name = @auth_hash.info['last_name']
    first_name = @auth_hash.info['name'] if first_name.blank? && last_name.blank?

    Rails.logger.info 'raw '+@auth_hash.to_json

    user.update_attributes(
        first_name: first_name,
        last_name: last_name,
        photo: @auth_hash.info['image'],
        profile_url: @auth_hash.info['urls'].values.last,
        access_token: @auth_hash.credentials['token'])

    user.persisted? ? user : nil
  end
end
