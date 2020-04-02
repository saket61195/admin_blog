class VisitorMessageService
	attr_reader :params

	def initialize(params)
		@params = params
	end

	def visitor
    build_existing_visitor_message || build_new_visitor_message
  end

	private

  def existing_visitor
    @visitor ||= Visitor.find_by(email: params[:email])
  end

  def build_new_visitor_message
    Visitor.new(params)
  end

  def message
    params[:messages_attributes]['0']
  end

  def build_existing_visitor_message
    return unless existing_visitor
    existing_visitor.tap do |v|
      v.messages << Message.new(message)
    end
  end
end