class Admin::SessionsController < Admin::ApplicationController
	before_action :authorize, except:[:new,:create]
  def new
  end

  def create
  	@moderator = Moderator.find_by(username: params[:username]).try(:authenticate,params[:password])
  	if @moderator
	  	session[:current_moderator_id] = @moderator.id
	  	redirect_to admin_moderators_url, notice: 'you have successfully sign in'
  	else
	  	flash[:alert] = 'there is problem with username and password'
	  	render :new
  	end
	end

  def destroy
  	session[:current_moderator_id]=nil
  	redirect_to '/login', notice: 'you have successfully logout'
  end
end
