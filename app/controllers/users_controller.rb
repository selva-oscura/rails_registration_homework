class UsersController < ApplicationController
  
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :text => "here"
      # render action: "new"
    end
  end

#### John's way
#   def create
#      #render :text => params
#      user = User.new(params[:user])
#      if(user.save)
# #       render :text => "user added"
#     flash[:message] = "User Added"
#      end
#      redirect_to :back
#   end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
      if @user.update_attributes(params[:id])
        redirect_to @user
      else
##next line is pseudo-code?        
        render edit page
      end
  end

  def delete
    User.find(params[:id]).destroy
##next line is pseudo-code?
    render index
  end
end
