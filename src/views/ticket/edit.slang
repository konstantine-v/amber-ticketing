button
  == link_to("Back To Tickets", "/tickets/#{ticket.id.to_s}", class: "btn btn-light btn-sm")
hr
h1 Edit Ticket ##{ticket.id.to_s}
- if ticket.errors
  ul.errors
    - ticket.errors.each do |error|
      li = error.to_s
== form(action: "/tickets/#{ticket.id.to_s}", method: ticket.id ? :patch : :post) do
  == csrf_tag
  == text_field(name: "title", required: true, value: ticket.title, placeholder: "Title")
  == text_field(name: "url", value: ticket.url, placeholder: "Link to problem")
  == text_area(name: "desc", required: true, content: ticket.desc, placeholder: "Write out the description of your issues. Please make sure to be thorough in describing your issue.", size: "30x10")
  label Status
  == select_field(name: "solved", collection: [[0, "Waiting"], [1, "In Progress"], [2, "Resolved"], [3, "Closed"]], selected: ticket.solved)
  label Urgency
  == select_field(name: "urgency", collection: [[0,"Not Urgent"],[1, "Level 1"], [2, "Level 2"]], selected: ticket.urgency)
  == submit("Submit")
