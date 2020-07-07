button.success
 a href="/tickets/new" New Ticket
hr
h1 Tickets
div
  table
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
          td
           == link_to("#{ticket.title}", "/tickets/#{ticket.id}")
          td
           == link_to("#{ticket.user.name} - #{ticket.user.company}", "/users/#{ticket.user.id}")
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
             span class="tag tag-lvl#{ticket.urgency}" = ticket.urgency
          td
            button
              == link_to("Show", "/tickets/#{ticket.id}")
            button
              == link_to("Edit", "/tickets/#{ticket.id}/edit")
            button.danger
              == link_to("Delete", "/tickets/#{ ticket.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?")
