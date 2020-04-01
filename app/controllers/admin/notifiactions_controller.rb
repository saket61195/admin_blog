class Admin::NotifiactionsController < Admin::ApplicationController
  def index
  	@visitor_notifications = Notification.where(notifiable_type: 'Visitor').order(id: :desc)
  	@comment_notifications = Notification.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
  	@notifible = Notification.find(params[:id])
  	@notifible.destroy
  	redirect_to :back, notice: 'Notification was sucessfully dismiss'
  end

  def delete_all
  	Notification.delete_all
  	redirect_to :back, notice: 'All notification Delete'
  end
end
