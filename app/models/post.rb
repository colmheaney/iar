class Post < ActiveRecord::Base
  attr_accessible :body, :published_date, :title, :category_ids
  validates_presence_of :body, :published_date, :title, :user_id
  belongs_to :user
  has_and_belongs_to_many :categories
end
