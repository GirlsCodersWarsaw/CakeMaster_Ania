class Cake < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :kind, presence: true,
  validates :description, presence: true, length: { minimum: 10, maximum: 5000 }

end