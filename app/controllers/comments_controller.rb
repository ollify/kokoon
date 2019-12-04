class CommentsController < ApplicationController
  before_action :set_ticket
  before_action :set_comment, only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.ticket = @ticket
    @comment.user = current_user
    authorize @comment

    if @comment.save
      # ActionCable.server.broadcast("ticket_#{@ticket.id}",
      # {comment_partial: render(partial: "comments/show", locals: {comment: @comment})}
      # )
    respond_to do |format|
      format.html { redirect_to flat_rental_ticket_path(@ticket.rental.flat, @ticket.rental, @ticket) }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
    else
      respond_to do |format|
        format.html { render 'tickets/show' }
        format.js
      end
    end
  end

  def destroy
    @comment.destroy
    authorize @comment
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
