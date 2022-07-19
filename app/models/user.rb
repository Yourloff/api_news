class User < ApplicationRecord
  has_many :articles
  has_many :favorite_articles, dependent: :destroy

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end
