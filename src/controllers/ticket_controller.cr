class TicketController < ApplicationController
  getter ticket = Ticket.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_ticket }
  end

  def index
    tickets = Ticket.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    ticket = Ticket.new ticket_params.validate!
    if (current_user = context.current_user)
      ticket.user_id = current_user.id
    end
    ticket.solved = 0 #change from solved to status
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
    ticket.destroy
    redirect_to action: :index, flash: {"success" => "Ticket has been deleted."}
  end

  private def ticket_params
    params.validation do
      required(:title){|f| !f.nil? && !f.empty? }
      required(:desc){|f| !f.nil? && !f.empty? }
      required(:urgency){|f| !f.nil? && !f.empty? }
      optional :solved
      optional :user_id
    end
  end

  private def set_ticket
    @ticket = Ticket.find! params[:id]
  end
end
