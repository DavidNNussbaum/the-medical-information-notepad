class ImmunizationsController < ApplicationController
    before_action :find_immunization, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
      @immunization = Immunization.find_by(id: params[:user_id])
      if @user
        @immunizations = Immunization.where(user: @user).order_by_name
      else
        @immunizations = Immunization.all
      end
      if params[:search]
        @immunizations = @immunizations.search_by_name(params[:search]).order_by_name
      end
      @immunizations = @immunizations.distinct
     end
  
    def new
      @immunization = Immunization.new
      @user = User.find_by(id: params[:user_id])

    end
  
    def show
      find_immunization
    end
  
    def edit
 
    end
  
    def create
      @immunization = Immunization.new(immunization_params)
      if @immunization.save
          redirect_to immunizations_path(@immunization.user)
        else  
            flash[:danger] = 'This Immunization Is Already In Our System'
            render 'sessions/homepage'
        end
    end
  
    def update
      if @immunization.update(immunization_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @immunization.destroy
            redirect_to immunizations_path
        else
            redirect_to back
        end
  end


private

  def find_immunization
    @immunization = Immunization.find(params[:id])
  end
  
    def immunization_params
      params.require(:immunization).permit(
        :name,
        :date,
        :user_id
      )
  
    end
end
 