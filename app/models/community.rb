class Community < ApplicationRecord
	has_many :joins
  has_many :users, through: :joins

  validates :name,    presence: true # 名前空だめ
  validates :content, presence: true # 概要空だめ
end
