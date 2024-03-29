class User < ActiveRecord::Base
  devise :trackable, :omniauthable

  def self.find_for_user_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']

    if user = User.find_by_provider_and_uid(access_token['provider'], access_token['uid'])
      user
    else
      if data['screen_name']
        # twitter
        name = data['screen_name']
      else
        # facebook
        name = data['name']
      end
      User.create!({
                    :uid => access_token['uid'],
                    :provider => access_token['provider'],
                    :screen_name => name,
                    :email => data['email'] || "",
                    :access_token => access_token['credentials']['token'] || "",
                    :access_secret => access_token['credentials']['secret'] || ""
      })
    end
  end
end
