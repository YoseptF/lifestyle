class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }, uniqueness: { case_sensitive: false }
  validates :priority, presence: true

  has_and_belongs_to_many :articles, -> { order(created_at: :desc).includes(:image_attachment) }
  has_and_belongs_to_many :first_article, lambda {
                                            order(created_at: :desc)
                                              .includes(:image_attachment)
                                              .limit(1)
                                          }, class_name: 'Article'

  scope :by_priority, -> { order(priority: :desc).includes(:first_article) }
  scope :for_navbar, -> { limit(5) }
end
