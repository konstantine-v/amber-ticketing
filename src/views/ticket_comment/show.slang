h1 Show Ticket Comment
p = ticket_comment.ticket.id
p = ticket_comment.body
p
  == link_to("Back", "/ticket_comments", class: "btn btn-light btn-sm")
  == link_to("Edit", "/ticket_comments/#{ticket_comment.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/ticket_comments/#{ticket_comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
