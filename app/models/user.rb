class User < ActiveRecord::Base
    has_many :joins
    has_many :communities, through: :joins
    

   #validate :check_number_of_users

   #def check_number_of_users
     #if join.user && join.community.count > 0
       #errors.add(:community, "人数OVER")
     #end
   #end

    #名前
    validates :name,  presence: true, length: { maximum: 50 }
    #メール
    VALID_EMAIL_REGEX = /\As[0-9]{7}+@[u|s].tsukuba.ac.jp/
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    #パスワード
    validates :password, presence: true

    mount_uploader :picture, PictureUploader

    before_save { email.downcase! }
  
    has_secure_password
  
    def self.new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def self.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
end