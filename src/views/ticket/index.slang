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
        th User
        th Status
        th Urgency
        th Actions
    tbody
      - tickets.each do |ticket|
        tr
          td = ticket.title
          td #{ticket.user.name}, #{ticket.user.company}
          td
           span class="tag tag-st#{ticket.solved}"
            - if ticket.solved == 0
              | Waiting
            - if ticket.solved == 1
              | In-Progress
            - if ticket.solved == 2
              | Resolved
          td
           - if ticket.solved != 2
            - if ticket.urgency != 0
             span class="tag tag-lvl#{ticket.urgency}" Level #{ticket.urgency}
          td
            span
              == link_to("Show", "/tickets/#{ticket.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/tickets/#{ticket.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/tickets/#{ ticket.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
css:
  .tag {color: white; padding: 4px 11px; margin:0 .5rem 0 0; border-radius: .5rem;}
  .tag-blu {background:cornflowerblue}
  .tag-orn {background:coral}
  .tag-st0 {background:grey}
  .tag-st1 {background:coral}
  .tag-st2 {background:cornflowerblue}
  .tag-lvl1 {background:coral}
  .tag-lvl2 {background:crimson}
