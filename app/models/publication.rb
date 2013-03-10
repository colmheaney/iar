class Publication < ActiveRecord::Base
  attr_accessible :description, :title, :image, :file, :type

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
  validates :image, presence: true
  validates :file, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :file, ImageUploader

  def self.all_publication_types
    %w(Magazine Leaflet Poster Paper)
  end  
end
