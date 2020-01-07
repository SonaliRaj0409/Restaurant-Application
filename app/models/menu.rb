class Menu < ActiveRecord::Base
  belongs_to :restaurant
  default_scope -> { order(created_at: :desc) }
  #validates :restaurant_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
end
