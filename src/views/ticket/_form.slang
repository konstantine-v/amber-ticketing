- if ticket.errors
  ul.errors
    - ticket.errors.each do |error|
      li = error.to_s

== form(action: "/tickets/#{ticket.id.to_s}", method: ticket.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: ticket.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_area(name: "desc", content: ticket.desc, placeholder: "Desc", class: "form-control", size: "30x10")
  .form-group
    == text_field(name: "solved", value: ticket.solved, placeholder: "Solved", class: "form-control")
  .form-group
    == text_field(name: "urgency", value: ticket.urgency, placeholder: "Urgency", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/tickets", class: "btn btn-light btn-sm")
