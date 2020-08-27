class UserController < ApplicationController
  getter user = User.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_user }
  end

  def index
    users = User.all
    render "index.slang"
  end

  def show
    tickets = Ticket.where(user_id: user.id)
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    user = User.new user_params.validate!
    pass = user_params.validate!["password"]
    user.password = pass if pass
    user.role = 0
    user.approved = 0
    if user.save
      session[:user_id] = user.id
      redirect_to "/", flash: {"success" => "Created User successfully. Please wait for an Admin to approve your account."}
    else
      flash[:danger] = "Could not create User!"
      render "new.slang"
    end
  end

  def update
    user.set_attributes user_params.validate!
    if user.save
      redirect_to action: :index, flash: {"success" => "User has been updated."}
    else
      flash[:danger] = "Could not update User!"
      render "edit.slang"
    end
  end

  def destroy
    token = {csrf: csrf_tag}.to_json
    puts token
    if user.destroy
      redirect_to action: :index, flash: {"success" => "User has been deleted."}
    else
      flash[:danger] = "#{token} - Could not delete User!"
    end
  end

  private def user_params
    params.validation do
      required :email
      required :name
      required :company
      optional :password
      optional :approved
      optional :role
      optional :phone
      optional :about
    end
  end

  private def set_user
    @user = User.find! params[:id]
  end
end
