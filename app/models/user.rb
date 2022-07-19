class User < ApplicationRecord
  has_many :articles
  has_many :favorite_articles, dependent: :destroy

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  scope :authors, -> { joins(:articles).where(articles: { published: true }).distinct }
end
