class Cake < ActiveRecord::Base
  has_many :cake_attachments
  accepts_nested_attributes_for :cake_attachments

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :kind, presence: true, inclusion: { in: %w(tasty non-gluten vegan), message: "%{value} is not a valid kind" }
  validates :description, presence: true, length: { minimum: 10, maximum: 5000 }

  mount_uploader :image, ::ImageUploader
end