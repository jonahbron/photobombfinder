class Bomb < ActiveRecord::Base
  belongs_to :user
  has_many :matches
  has_many :photos, through: :matches
end
