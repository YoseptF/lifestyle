class Category < ApplicationRecord
  validates :name, presence: true, length: {in: 2..30}, uniqueness: { case_sensitive: false }
  # validates :priority, presence: true

  has_and_belongs_to_many :articles
end
