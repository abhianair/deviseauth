class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	devise :omniauthable, omniauth_providers: %i[facebook]
	belongs_to :department, optional: true

	# mount_uploader :avatar, AvatarUploader
	# has_attached_file :image


	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0, 20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.avatar = auth.info.image # assuming the user model has an image
	    p "this is it !!!!!!!!!!!!!!!!!!!!!!!!1"
	    p auth.info.image
	    # If you are using confirmable and the provider(s) you use validate emails, 
	    # uncomment the line below to skip the confirmation emails.
	    # user.skip_confirmation!
	  end
	end

	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
	end
end
