class Book < ActiveRecord::Base
  attr_accessible :author, :edition, :publisher, :title ,:category_id ,:price ,:image

  validates :author ,:title ,:image ,:category_id ,:presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title ,:uniqueness => true
  
end
