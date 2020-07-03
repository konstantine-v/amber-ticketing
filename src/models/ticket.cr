class Ticket < Granite::Base
  connection sqlite
  table tickets

  column id : Int64, primary: true
  column title : String?
  column desc : String?
  column solved : Int64?
  column urgency : Int64?
end
