class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout 'admin'

	before_action :authorize

	def current_moderator
		@moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
	end

	def authorize
		unless current_moderator
			redirect_to '/login', alert: 'please login first to view admin'
		end
	end

	def to_bool string
		ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
	end
end