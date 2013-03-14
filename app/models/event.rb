class Event < ActiveRecord::Base
    attr_accessible :date, :description, :location, :title, :news

    validates :title, presence: true, length: { maximum: 50 }
    validates :news, presence: true
    validates :description, presence: true, length: { maximum: 300 }
	
	scope :by_news, lambda { where(['news = ?', 1]) }
end
