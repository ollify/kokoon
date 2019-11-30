class CommentsController < ApplicationController
  before_action :set_ticket

  def create
    @comment = Comment.new(comment_params)
    @comment.ticket = @ticket
    @comment.user = current_user
    authorize @comment
    @comment.save
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
