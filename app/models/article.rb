class Article < ApplicationRecord
  validates :title, presence: true, length: {in: 3..20}
  validates :text, presence: true, length: {in: 15..1500}

  has_and_belongs_to_many :categories
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, class_name: 'User'

  has_one_attached :image
end
