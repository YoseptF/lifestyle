class User < ApplicationRecord
  validates :name, presence: true, length: {in: 3..30}, uniqueness: { case_sensitive: false }

  has_many :articles, foreign_key: 'author_id', dependent: :destroy
end
