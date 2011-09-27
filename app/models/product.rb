class Product < ActiveRecord::Base
  has_and_belongs_to_many :members
  
  mount_uploader :image, ImageUploader
end
