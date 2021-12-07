class PatientsController < ApplicationController
    before_action :find_patient, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in, except: [:welcome, :new, :create]

    def welcome
      render :welcome
    end 

    def show
        find_patient
    end
  
    def new
      @patient = Patient.new

      render :signup
    end
  
    def edit
 
    end
  
    def create
        @patient = Patient.new(user_params)
        if @patient.save
          session[:patient_id] = @patient.id
          redirect_to @patient        
        else  
          render :new
        end
    end
  
    def update
      if @patient.update(patient_params)
        redirect_to patient_path(@patient)
      else 
        render :edit
      end
    end


  def destroy
        if @patient.destroy
            redirect_to patient_path
        else
            redirect_to back
        end
  end
private

  def find_patient
    @patient = Patient.find(params[:id])
  end
  
    def patient_params
      params.require(:patient).permit(:username, :diagnoses, :allergies, :current_treatments, :password, :password_confirmation)
    end
end

 
