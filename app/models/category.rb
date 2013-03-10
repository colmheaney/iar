class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: { case_sensitive: false}  
  has_and_belongs_to_many :posts
end
