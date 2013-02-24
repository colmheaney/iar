class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :title

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :location, presence: true, length: { maximum: 50 }
end
