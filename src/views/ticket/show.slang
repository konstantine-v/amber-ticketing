h1 Ticket ##{ticket.id.to_s}
span class="tag tag-#{ticket.solved == 0 ? "orn" : "blu"}"
 | Status: #{ticket.solved == 0 ? "In Progress" : "Solved"}
- if ticket.urgency == 0
- else
  span class="tag tag-lvl#{ticket.urgency}" Urgency: Level #{ticket.urgency}
h2.mt-3 = ticket.title
p = ticket.desc
p = ticket.created_at.not_nil!
p = ticket.updated_at.not_nil!
hr
- if (current_user = context.current_user)
  - if current_user.role == 2
    You ADMIN
  hr
p User
p = ticket.user.email
p = ticket.user.name
p = ticket.user.role

p
  == link_to("Back", "/tickets", class: "btn btn-light btn-sm")
  == link_to("Edit", "/tickets/#{ticket.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/tickets/#{ticket.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

css:
  .tag {color: white; padding: 4px 11px; margin:0 .5rem 0 0; border-radius: .5rem;}
  .tag-blu {background:cornflowerblue}
  .tag-orn {background:coral}
  .tag-lvl1 {background:coral}
  .tag-lvl2 {background:crimson}
