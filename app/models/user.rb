class User < ActiveRecord::Base
  has_many :tasks
  validates :email, :uid, :provider, presence: true

  def self.build_from_github(auth_hash)
    user       = User.new
    user.uid   = auth_hash[:uid]
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']

    return user
  end

  def destroy
    session[:user_id] = nil
  end
end
