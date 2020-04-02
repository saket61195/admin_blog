class VisitorCommentService
	attr_reader :params

	def initialize(params)
		@params = params
	end

	def visitor
    build_existing_visitor_comment || build_new_visitor_comment
  end

	private

  def existing_visitor
    @visitor ||= Visitor.find_by(email: params[:email])
  end

  def build_new_visitor_comment
    Visitor.new(params)
  end

  def comment
    params[:comments_attributes]['0']
  end

  def build_existing_visitor_comment
    return unless existing_visitor
    existing_visitor.tap do |v|
      v.comments << Comment.new(comment)
    end
  end
end