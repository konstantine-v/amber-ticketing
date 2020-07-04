h1 New Ticket
- if ticket.errors
  ul.errors
    - ticket.errors.each do |error|
      li = error.to_s
== form(action: "/tickets/#{ticket.id.to_s}", method: ticket.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", required: true, value: ticket.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_area(name: "desc", required: true, content: ticket.desc, placeholder: "Desc", class: "form-control", size: "30x10")
  .form-group
    label Urgency
    == select_field(name: "urgency", collection: [[0,"Not Urgent"],[1, "Level 1"], [2, "Level 2"]], selected: ticket.urgency)
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/tickets", class: "btn btn-light btn-sm")
