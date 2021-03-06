class ArticleComment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :comment, length: { in: 1..30 }
end
