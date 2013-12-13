# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 #Book.delete_all
 #Category.delete_all
 User.delete_all


User.create!(name: 'Awin', email: 'awin@example.com', password: 'awin', admin: true)
User.create!(name: 'Hisham', email: 'hisham@example.com', password: 'hisham', admin: true)
User.create!(name: 'Awin1', email: 'awin1@example.com', password: 'awin1', admin: false)
User.create!(name: 'Awin2', email: 'awin2@example.com', password: 'awin2', admin:false)

require "open-uri"
require 'googlebooks'

books = GoogleBooks.search('comics', {:count => 40}) 
books.each do |bk|
	c = Category.find_or_create_by_name("#{bk.categories.present? ? bk.categories : 'Others'}")
	b = Book.create!(title: bk.title, author: "#{bk.authors.present? ? bk.authors : 'Hisham CG'}", publisher: bk.publisher, category_id: c.id, price: bk.page_count.to_s.to_i+50, image: "#{bk.image_link}")
        if Rails.env.development?
	  require "open-uri"
	  File.open("/home/hisham/work/learn/app/assets/images/image-#{b.id}.jpg", 'wb') do |fo|
	    fo.write open("#{bk.image_link}").read 
	  end
       end
end
if Rails.env.development?
  Book.all.map {|b| b.image = "image-#{b.id}.jpg"; b.save }
end
