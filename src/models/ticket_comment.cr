class TicketComment < Granite::Base
  connection sqlite
  table ticket_comments

  belongs_to :ticket
  belongs_to :user

  column id : Int64, primary: true
  column body : String?
end
