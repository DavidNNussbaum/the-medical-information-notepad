class SubjectivesController < ApplicationController
    before_action :find_subjective, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
      @subjective = Subjective.find_by(id: params[:user_id])
      if @user
        @subjectives = Subjective.where(user: @user).order_by_name
      else
        @subjectives = Subjective.all
      end
      if params[:search]
        @subjectives = @subjectives.search_by_name(params[:search]).order_by_name
      end
      @subjectives = @subjectives.distinct
     end
  
    def new
      @subjective = Subjective.new
      @user = User.find_by(id: params[:user_id])

    end
  
    def show
      find_subjective
    end
  
    def edit
 
    end
  
    def create
      @subjective = Subjective.new(subjective_params)
      if @subjective.save
          redirect_to subjectives_path(@subjective.patient)
        else  
            flash[:danger] = 'This Subjective Is Already In Our System'
            render 'sessions/homepage'
        end
    end
  
    def update
      if @subjective.update(subjective_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @subjective.destroy
            redirect_to subjectives_path
        else
            redirect_to back
        end
  end


private

  def find_medication
    @subjective = Subjective.find(params[:id])
  end
  
    def subjective_params
      params.require(:subjective).permit(
        :description,
        :scale,
        :location,
        :observed_changes,
        :start_date,
        :user_id
      )
  
    end
end

 

 