class CakeAttachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :cake
end
