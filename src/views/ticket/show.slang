h1 Show Ticket
p = ticket.title
p = ticket.desc
p = ticket.solved
p = ticket.urgency
p
  == link_to("Back", "/tickets", class: "btn btn-light btn-sm")
  == link_to("Edit", "/tickets/#{ticket.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/tickets/#{ticket.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
