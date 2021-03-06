class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 3..150 }
  validates :text, presence: true, length: { in: 15..35_000 }
  validates_presence_of :image

  has_and_belongs_to_many :categories
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, class_name: 'User'

  has_one_attached :image

  scope :featured, lambda {
                     joins(:votes)
                       .select('articles.*')
                       .order('COUNT(votes.article_id) DESC')
                       .group('articles.title, articles.id').limit(1).take
                   }
end
