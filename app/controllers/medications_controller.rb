class MedicationsController < ApplicationController
    before_action :find_medication, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
      @medication = Medication.find_by(id: params[:patient_id])
      if @user
        @medications = Medication.where(user: @user).order_by_name
      else
        @medications = Medication.all
      end
      if params[:search]
        @medications = @medications.search_by_name(params[:search]).order_by_name
      end
      @medications = @medications.distinct
     end
  
    def new
      @medication = Medication.new
      @user = User.find_by(id: params[:user_id])

    end
  
    def show
      find_medication
    end
  
    def edit
 
    end
  
    def create
      @medication = Medication.new(medication_params)
      if @medication.save
          redirect_to medications_path(@medication.user)
        else  
            flash[:danger] = 'This Medication Is Already In Our System'
            render 'sessions/homepage'
        end
    end
  
    def update
      if @medication.update(medication_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @medication.destroy
            redirect_to medications_path
        else
            redirect_to back
        end
  end


private

  def find_medication
    @medication = Medication.find(params[:id])
  end
  
    def medication_params
      params.require(:medication).permit(
        :name,
        :strength,
        :route,
        :frequency,
        :user_id
      )
  
    end
end

 