class Admins::CommentsController < ApplicationController
  respond_to :html, :xml, :js
  
  def index
    @comments = Comment.all(:order => "created_at DESC")
  end
  
  # DELETE /admins/comments/1
  # DELETE /admins/comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      logger.debug("destroy ok!!!")
      respond_with(@comment)
    else
      logger.debug("destroy problem!")
    end
    
  end
  
  
end
