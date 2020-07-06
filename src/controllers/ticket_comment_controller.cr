class TicketCommentController < ApplicationController
  getter ticket_comment = TicketComment.new

  before_action do
    only [:update, :destroy] { set_ticket_comment }
  end

  def index
    comments = TicketComment.all
    render "index.slang"
  end

  def create
    comment = TicketComment.new ticket_comment_params.validate!
    if (current_user = context.current_user)
      comment.user_id = current_user.id
      ticket_id = context.request.path.to_s.gsub("/comments/","").gsub("/new","").chomp.to_i64
      comment.ticket_id = ticket_id
    end
    if comment.save
      redirect_to "/tickets/#{ticket_id}", flash: {"success" => "Comment has been created."}
    else
      redirect_to "/tickets/#{ticket_id}", flash: {"danger" => "Comment could not be created."}
    end
  end

  def update
    ticket_comment.set_attributes ticket_comment_params.validate!
    if ticket_comment.save
      redirect_to action: :index, flash: {"success" => "Comment has been updated."}
    else
      flash[:danger] = "Could not update TicketComment!"
      render "edit.slang"
    end
  end

  def destroy
    ticket_comment.destroy
    ticket_id = ticket_comment.ticket_id
    redirect_to "/tickets/#{ticket_id}", flash: {"success" => "Comment has been deleted."}
  end

  private def ticket_comment_params
    params.validation do
      required :body
      optional :ticket_id
      optional :user_id
    end
  end

  private def set_ticket_comment
    @ticket_comment = TicketComment.find! params[:id]
  end
end
