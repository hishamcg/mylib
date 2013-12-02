class User < ActiveRecord::Base
  attr_accessible :email, :name , :password ,:password_salt
  has_many :rentals

  before_save :encrypt_password 

  validates_presence_of :email
  validates_presence_of :name 
  validates_uniqueness_of :name
  validates_presence_of :password

  def self.authenticate(email, password)
    p "email,password #{email}, #{password}"
    @user = find_by_email(email)
    if @user && @user.password == BCrypt::Engine.hash_secret(password, @user.password_salt)
      @user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def books_in_hand
  	rentals.select{|r| !r.returned? }
  end

  def read_books 
  	rentals.select{|r| r.returned?}
  end
end
