.row
  .col-sm-11
    h2 Tickets
  .col-sm-1
    a.btn.btn-success.btn-sm href="/tickets/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Desc
        th Solved
        th Urgency
        th Actions
    tbody
      - tickets.each do |ticket|
        tr
          td = ticket.title
          td = ticket.desc
          td = ticket.solved
          td = ticket.urgency
          td
            span
              == link_to("Show", "/tickets/#{ticket.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/tickets/#{ticket.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/tickets/#{ ticket.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
