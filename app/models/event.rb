class Event < ActiveRecord::Base
    attr_accessible :date, :description, :location, :title, :news, :summary

    validates :title, presence: true, length: { maximum: 50 }
    validates :news, presence: true
    validates :summary, presence: true, length: {maximum: 150}
    validates :description, presence: true
	
	scope :by_news, lambda { where(['news = ?', 1]) }
end
