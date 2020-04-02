class PostsController < ApplicationController
  def index
  	if params[:tag]
  		@posts= Post.fiter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
  	else
  	@posts = Post.published.page(params[:page]).per(Setting.post_per_page)
  	end
  end

  def show
  	@post = Post.find(params[:id])
  	@visitor_comment = Visitor.new(comments:[Comment.new])
  end
end
