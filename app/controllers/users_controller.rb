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
              render :text => "update_ack"
    end
  end

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
        render :text => "update_ack"
        # render edit page
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def delete
    User.find(params[:id]).destroy
  end
end
