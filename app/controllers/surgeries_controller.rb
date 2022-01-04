class SurgeriesController < ApplicationController
    before_action :find_surgery, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
      @surgery = Surgery.find_by(id: params[:user_id])
      if @patient
        @surgeries = Surgery.where(user: @user).order_by_name
      else
        @surgeries = Surgery.all
      end
      if params[:search]
        @surgeries = @surgeries.search_by_name(params[:search]).order_by_name
      end
      @surgeries = @surgeries.distinct
     end
  
    def new
      @surgery = Surgery.new
      @user = User.find_by(id: params[:user_id])

    end
  
    def show
      find_surgery
    end
  
    def edit
 
    end
  
    def create
      @surgery = Surgery.new(surgery_params)
      if @surgery.save
          redirect_to surgeries_path(@surgery.user)
        else  
            flash[:danger] = 'This Surgery Is Already In Our System'
            render 'sessions/homepage'
        end
    end
  
    def update
      if @surgery.update(surgery_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @surgery.destroy
            redirect_to surgeries_path
        else
            redirect_to back
        end
  end


private

  def find_surgery
    @surgery = Surgery.find(params[:id])
  end
  
    def surgery_params
      params.require(:surgery).permit(
        :name,
        :date,
        :user_id
      )
  
    end
end
 
