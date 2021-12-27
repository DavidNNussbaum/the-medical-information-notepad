class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in, except: [:welcome, :new, :create]

    def welcome
      render :welcome
    end 

    def show
        find_user
    end
  
    def new
      @user = User.new

      render :signup
    end
  
    def edit
 
    end
  
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user        
        else  
          render :new
        end
    end
  
    def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else 
        render :edit
      end
    end


  def destroy
        if @user.destroy
            redirect_to user_path
        else
            redirect_to back
        end
  end
private

  def find_user
    @user = User.find(params[:id])
  end
  
    def user_params
      params.require(:user).permit(:username, :diagnoses, :allergies, :current_treatments, :password, :password_confirmation)
    end
end

 
