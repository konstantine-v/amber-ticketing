class TicketController < ApplicationController
  getter ticket = Ticket.new
  getter comment = TicketComment.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_ticket }
  end

  def index
    if (current_user = context.current_user)
      if current_user.role == 2
        tickets = Ticket.order(solved: :asc, created_at: :desc)
        render "index.slang"
      else
        tickets = Ticket.where(user_id: current_user.id)
        render "index.slang"
      end
    end
  end

  def show
    comments = TicketComment.where(ticket_id: ticket.id).order(created_at: :desc)
    if (current_user = context.current_user)
      if current_user.role == 2
        render "show.slang"
      elsif ticket.user_id == current_user.id
        render "show.slang"
      else
        context.flash[:warning] = "Ticket Not Found"
        context.response.headers.add "Location", "/"
        context.response.status_code = 302
      end
    end
  end

  def new
    render "new.slang"
  end

  def edit
    if (current_user = context.current_user)
      if current_user.role == 2
        render "edit.slang"
      elsif ticket.user_id == current_user.id
        render "edit.slang"
      else
        context.flash[:warning] = "Ticket Not Found"
        context.response.headers.add "Location", "/"
        context.response.status_code = 302
      end
    end
  end

  def create
    ticket = Ticket.new ticket_params.validate!
    if (current_user = context.current_user)
      ticket.user_id = current_user.id
    end
    ticket.solved = 0
    if ticket.save
      redirect_to action: :index, flash: {"success" => "Ticket has been created."}
    else
      flash[:danger] = "Could not create Ticket!"
      render "new.slang"
    end
  end

  def update
    ticket.set_attributes ticket_params.validate!
    if ticket.save
      redirect_to action: :index, flash: {"success" => "Ticket has been updated."}
    else
      flash[:danger] = "Could not update Ticket!"
      render "edit.slang"
    end
  end

  def destroy
    if ticket = Ticket.find params["id"]
      ticket.destroy
    else
      flash["warning"] = "Ticket with ID #{params["id"]} Not Found"
    end
    redirect_to action: :index, flash: {"success" => "Ticket has been deleted."}
  end

  private def ticket_params
    params.validation do
      required :title
      required :desc
      required :urgency
      optional :user_id
      optional :url
      optional :solved
    end
  end

  private def set_ticket
    @ticket = Ticket.find! params[:id]
  end
end
