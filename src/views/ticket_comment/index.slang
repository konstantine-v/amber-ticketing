.row
  .col-sm-11
    h2 Ticket Comments
  .col-sm-1
    a.btn.btn-success.btn-sm href="/ticket_comments/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Ticket
        th Body
        th Actions
    tbody
      - ticket_comments.each do |ticket_comment|
        tr
          td = ticket_comment.ticket.id
          td = ticket_comment.body
          td
            span
              == link_to("Show", "/ticket_comments/#{ticket_comment.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/ticket_comments/#{ticket_comment.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/ticket_comments/#{ ticket_comment.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
