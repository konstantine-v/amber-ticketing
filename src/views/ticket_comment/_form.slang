- if ticket_comment.errors
  ul.errors
    - ticket_comment.errors.each do |error|
      li = error.to_s

== form(action: "/ticket_comments/#{ticket_comment.id.to_s}", method: ticket_comment.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:ticket)
    == select_field(name: "ticket_id", collection: Ticket.all.map{|ticket| [ticket.id, ticket.id]}, selected: ticket_comment.ticket_id, class: "form-control")
  .form-group
    == text_area(name: "body", content: ticket_comment.body, placeholder: "Body", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/ticket_comments", class: "btn btn-light btn-sm")
