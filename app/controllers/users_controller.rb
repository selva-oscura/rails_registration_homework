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
      flash[:success] = 'User was successfully updated'
      redirect_to @user
    else
      render @user
      # render :text => "create_ack"
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
      if @user.update_attributes(params[:user])
      # if @user.update(params[:id])
        flash[:success] = 'User was successfully updated'
        redirect_to @user
      else
##next line is pseudo-code?        
        render :text => "update_ack"
        # render edit page
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # flash[:success] = 'User was deleted with success.'
    redirect_to users_path
  end

  # def destroy
  #   User.find(params[:id]).destroy
  #   # flash[:success] = "User destroyed."
  #   # redirect_to users_url
  # end

  def delete
    User.find(params[:id]).destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   flash[:success] = 'User was deleted with success.'
  #   redirect_to users_path
  #   # render index
  end
end
