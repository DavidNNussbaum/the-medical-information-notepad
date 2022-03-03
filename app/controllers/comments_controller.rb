class CommentsController < ApplicationController
    # before_action :find_comment, only: [:show, :edit, :update, :destroy]
    # before_action :redirect_if_not_logged_in
    

     def index
      @comment = Comment.find_by(id: params[:user_id])
      if @user
        @comments = Comment.where(user: @user).order_by_name
      else
        @comments = Comment.all
      end
      if params[:search]
        @comments = @comments.search_by_name(params[:search]).order_by_name
      end
      @comments = @comments.distinct
     end
  
    def new
      @comment = Comment.new
      @user = User.find_by(id: params[:user_id])

    end
  
    def show
      find_comment
    end
  
    def edit
 
    end
  
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
          redirect_to patient_comments_path(@comment.patient)
        else  
            flash[:danger] = 'This Comment Is Already In Our System'
            render 'sessions/homepage'
        end
    end
  
    def update
      if @comment.update(comment_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @comment.destroy
            redirect_to comments_path
        else
            redirect_to back
        end
  end


private

  def find_comment
    @comment = Comment.find(params[:id])
  end
  
    def comment_params
      params.require(:comment).permit(
        :description,
        :user_id
      )
  
    end
end
