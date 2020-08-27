a href="/tickets"
  button.normal Back To Tickets
hr
h1 New Ticket
- if ticket.errors
  ul.errors
    - ticket.errors.each do |error|
      li = error.to_s
== form(action: "/tickets/#{ticket.id.to_s}", method: ticket.id ? :patch : :post) do
  == csrf_tag
  == text_field(name: "title", required: true, value: ticket.title, placeholder: "Title", class: "form-control")
  == text_field(name: "url", value: ticket.url, placeholder: "Link to problem", class: "form-control")
  == text_area(name: "desc", required: true, content: ticket.desc, placeholder: "Desc", class: "form-control", size: "30x10")
  p Urgency
  == select_field(name: "urgency", collection: [[0,"Not Urgent"],[1, "Level 1"], [2, "Level 2"]], selected: ticket.urgency)
  br
  == submit("Submit", class: "btn btn-success btn-sm")
