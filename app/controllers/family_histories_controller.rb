class FamilyHistoriesController < ApplicationController
    before_action :find_family_history, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
      @family_history = FamilyHistory.find_by(id: params[:patient_id])
      if @patient
        @family_histories = FamilyHistory.where(patient: @patient).order_by_name
      else
        @family_histories = FamilyHistory.all
      end
      if params[:search]
        @family_histories = @family_histories.search_by_name(params[:search]).order_by_name
      end
      @family_histories = @family_histories.distinct
     end
  
    def new
      @family_history = FamilyHistory.new
      @patient = Patient.find_by(id: params[:patient_id])

    end
  
    def show
      find_family_history
    end
  
    def edit
 
    end
  
    def create
      @family_history = FamilyHistory.new(family_history_params)
      if @family_history.save
          redirect_to patient_family_histories_path(@family_history.patient)
        else  
            flash[:danger] = 'This Family History Is Already In Our System'
            render 'sessions/homepage'
        end
    end
  
    def update
      if @family_history.update(family_history_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @family_history.destroy
            redirect_to family_histories_path
        else
            redirect_to back
        end
  end


private

  def find_family_history
    @family_history = FamilyHistory.find(params[:id])
  end
  
    def family_history_params
      params.require(:family_history).permit(
        :diagnosis,
        :mother,
        :father,
        :sister,
        :brother,
        :patient_id
      )
  
    end
end
 