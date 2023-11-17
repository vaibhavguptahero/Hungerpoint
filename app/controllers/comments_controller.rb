class CommentsController < ApplicationController
  before_action :find_restaurant
  before_action :find_comment, only: [:show, :edit,:update, :destroy]

  def create
    @comment= @restaurant.comments.build(comment_params)
    @comment.user_id= current_user.id
    if @comment.save
        flash[:notice]= "Successfully Created Comment"
        redirect_to restaurant_path(@restaurant)
    end
    
  end

  def edit
     
    
  end

  def update
      if @comment.update(comment_params)
        flash[:notice]= "Successfully Updated Comment"
        redirect_to restaurant_path(@restaurant)
      else
        flash[:error]= "Comment not Updated"
        render 'edit'
      end
  end

  def destroy
      if @comment.destroy
          redirect_to restaurant_path(@restaurant)
          flash[:notice]= "Successfully Deleted Comment"
      else
      flash[:error]= "Comment not deleted"
      end
  end



  private

  def comment_params
      params.require(:comment).permit(:content)
  end

  def find_restaurant
      @restaurant=Restaurant.find(params[:restaurant_id])
  end

  
  def find_comment
      @comment = @restaurant.comments.find(params[:id])
  end

end
