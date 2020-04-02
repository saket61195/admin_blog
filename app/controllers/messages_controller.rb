class MessagesController < ApplicationController
  def new
  	@visitor_message = Visitor.new(messages: [Message.new])
  end

  def create
  	if visitor.save
  		flash[:notice] = 'successfully sent meaasge'
  		redirect_to new_message_path
  	else
  		@visitor_message = visitor
  		render :new
  	end
  end

  private

  def strong_params
  	params.require(:visitor).permit(:fullname,:email,:messages_attributes => [:content])
  end
  def visitor
  	 @visitor ||= VisitorMessageService.new(strong_params).visitor
  end
end
