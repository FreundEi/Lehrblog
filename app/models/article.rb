class Article < ApplicationRecord
  belongs_to :user

  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
end
