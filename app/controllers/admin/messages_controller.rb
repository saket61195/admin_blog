class Admin::MessagesController < Admin::ApplicationController
  def index
  	if params[:search].present?
      @messages = Message.matching_fullname_or_content(params[:search]).page params[:page]
    else
  	@messages = Message.all.order(id: :desc).page params[:page]
  	end
  end

  def show
  	@message = Message.find(params[:id])
  end

  def update
  	@message = Message.find(params[:id])
  	@message.update(status:params[:status])
  	redirect_to :back, notice: 'succesfully updated maessage'
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy
  	redirect_to :back, notice: 'Message delete succesfully'
  end
end
