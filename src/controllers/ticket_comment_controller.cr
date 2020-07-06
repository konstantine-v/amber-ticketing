class TicketCommentController < ApplicationController
  getter ticket_comment = TicketComment.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_ticket_comment }
  end

  def index
    ticket_comments = TicketComment.all
    render "index.slang"
  end

  def create
    ticket_comment = TicketComment.new ticket_comment_params.validate!
    if ticket_comment.save
      redirect_to action: :index, flash: {"success" => "Ticket_comment has been created."}
    else
      flash[:danger] = "Could not create TicketComment!"
      render "new.slang"
    end
  end

  def update
    ticket_comment.set_attributes ticket_comment_params.validate!
    if ticket_comment.save
      redirect_to action: :index, flash: {"success" => "Ticket_comment has been updated."}
    else
      flash[:danger] = "Could not update TicketComment!"
      render "edit.slang"
    end
  end

  def destroy
    ticket_comment.destroy
    redirect_to action: :index, flash: {"success" => "Ticket_comment has been deleted."}
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
