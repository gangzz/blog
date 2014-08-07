class Article < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  belongs_to :category, foreign_key: 'category_id'
  
  
  validates :title, presence: true, length: {minimum: 5}
end
