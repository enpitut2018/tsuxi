class User < ActiveRecord::Base
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