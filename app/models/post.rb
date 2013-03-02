class Post < ActiveRecord::Base
  attr_accessible :body, :published_date, :title, :category_ids
  validates_presence_of :body, :published_date, :title, :user_id
  belongs_to :user
  has_and_belongs_to_many :categories
  scope :published, lambda { where(['published_date <= ?', Date.today]) }
  scope :by_user_id, lambda { |uid| where(:user_id => uid) }
  scope :by_category_id, lambda { |cid| joins(:categories).where(['categories.id =?', cid]) }
end
