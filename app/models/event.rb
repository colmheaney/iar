class Event < ActiveRecord::Base
    attr_accessible :date, :description, :location, :title, :eventtype

    validates :title, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { maximum: 300 }
    validates :location, presence: true, length: { maximum: 50 }

  	scope :by_type, lambda { |type| where(:eventtype => type) }
  	#scope :previous, lambda { where(['date <= ?', Date.today]) }  	
end
