class Rental < ActiveRecord::Base
  attr_accessible :book_id, :returned_flag, :user_id

  belongs_to :user
  belongs_to :book

  def returned?
  	returned_flag==1
  end
end
