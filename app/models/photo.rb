class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  has_many :matches
  has_many :bombs, through: :matches
end
