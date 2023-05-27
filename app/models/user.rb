class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_one_attached :image
end

