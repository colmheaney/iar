class Publication < ActiveRecord::Base
  attr_accessible :description, :title, :image, :pubtype

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  scope :by_pubtype, lambda { |type| where(:pubtype => type) }
end


