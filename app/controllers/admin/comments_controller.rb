class Admin::CommentsController < Admin::ApplicationController
  def index
  	if params[:search].present?
		@comments = Comment.matching_full_name_or_message(params[:search]).page params[:page]
  	else
  	@comments = Comment.where(status: to_bool(params[:status])).page params[:page]
  	end
  end

  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(status: params[:status])
  		redirect_to :back, notice: 'successfully updated comment'
  	else
  		redirect_to :back, notice: 'there is problem updated comment'
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to :back, notice: 'Comment deleted successfully'
  end
end
