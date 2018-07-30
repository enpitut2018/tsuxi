class Community < ApplicationRecord
	has_many :joins
  has_many :users, through: :joins

  validates :name,    presence: true # 名前空だめ
  validates :content, presence: true # 概要空だめ

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Community.where(['name LIKE ?', "%#{search}%"])
    else
      Community.all #全て表示。
    end
  end
end
