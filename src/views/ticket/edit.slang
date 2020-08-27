a href="/tickets"
  button.normal Back To Tickets
hr
h1 Edit Ticket ##{ticket.id.to_s}
- if ticket.errors
  ul.errors
    - ticket.errors.each do |error|
      li = error.to_s
== form(action: "/tickets/#{ticket.id.to_s}", method: ticket.id ? :patch : :post) do
  == csrf_tag
  br
  label Title
  == text_field(name: "title", required: true, value: ticket.title, placeholder: "Title")
  br
  label Link to Issue
  == text_field(name: "url", value: ticket.url, placeholder: "Link to problem")
  br
  label Description
  == text_area(name: "desc", required: true, content: ticket.desc, placeholder: "Write out the description of your issues. Please make sure to be thorough in describing your issue.", size: "30x10")
  br
  label Status
  == select_field(name: "solved", collection: [[0, "Waiting"], [1, "In Progress"], [2, "Resolved"], [3, "Closed"]], selected: ticket.solved)
  br
  label Urgency
  == select_field(name: "urgency", collection: [[0,"Not Urgent"],[1, "Level 1"], [2, "Level 2"]], selected: ticket.urgency)
  == submit("Submit")
