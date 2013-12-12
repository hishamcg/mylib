class Book < ActiveRecord::Base
  attr_accessible :author, :edition, :publisher, :title ,:category_id ,:price ,:image

  validates :author ,:title ,:image ,:category_id ,:presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  # validates :title ,:uniqueness => true

  def self.search(s_word)
  	if s_word
	  	#titles=Book.all.map do |f|
	  	#	f.title
	  	#end
	  	
	  	# filtered_titles = titles.select {|t| !t.index(s_word).nil? }0


	  	#filtered_books = Book.all.select {|b| b.title.index(s_word).present?}
	  	filtered_books = Book.where("title LIKE ?","%#{s_word}%")
	 end
  end

  def image_link
    if Rails.env.development?
      "/assets/#{self.image}"
    else
      "#{self.image}"
    end
  end
  
end
