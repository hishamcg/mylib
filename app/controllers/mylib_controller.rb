class MylibController < ApplicationController


def welcome
   @user = User.new
end

def check
	
    user = User.authenticate(params[:user][:email], params[:user][:password])

  if user
    #session[:user_id] = user.id
    #redirect_to root_url, :notice => "Logged in!"
    sign_in(user)
    if(user.admin)
     redirect_to admin_url(:user => user), notice: "Hi #{user.name} welocme to Yourlib"
    else
     redirect_to hello_url(:user => user), notice: "Hi #{user.name} welocme to Mylib"
    end
  else
    #flash.now.alert = "Invalid email or password"
    #render "new"
    redirect_to welcome_url, notice: "wrong username or password"
  end
end

def signup
	@user=User.new
end

def create 	
  	user = User.new(params[:user])
	if @user.save
		redirect_to hello_url(:user => user) , notice: "signed up successfully"
	else
		render 'signup'
	end
end
def hello
   @user=current_user
end



def  category
  
  category = Category.find_by_name(params[:category_name])
  @data = Book.where(:category_id => category.id)
  @user=current_user
  render 'hello'
end

def proceedtopay
end

def admin
  @book = Book.all
end

def edit  
  @book=Book.find(params[:id])
end

def update
  @book=Book.find(params[:id])

  if @book.update_attributes(params[:book])
    redirect_to admin_url, notice: 'Book was successfully updated.' 
  else
    render action:"edit", notice: 'unprocessable_entity .' 
  end
end
def destroy
  @book=Book.find(params[:id])
  @book.destroy
  redirect_to admin_url 
end

def addnewbook
  @book=Book.new
  render action:"edit"
end

def newbook
  @book=Book.new(params[:book])
  if @book.save
    redirect_to admin_url , notice: 'product was successfully created'
  else
    p @book.errors.inspect
    redirect_to addnewbook_url
  end
end

end
