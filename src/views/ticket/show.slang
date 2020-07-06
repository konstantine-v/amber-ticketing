h1 Ticket ##{ticket.id.to_s}
span class="tag tag-st#{ticket.solved}"
 - if ticket.solved == 0
   | Status: Waiting
 - if ticket.solved == 1
   | Status: In-Progress
 - if ticket.solved == 2
   | Status: Resolved
- if ticket.urgency != 0
  span class="tag tag-lvl#{ticket.urgency}" Urgency: Level #{ticket.urgency}
h2.mt-3 = ticket.title
p = ticket.desc
hr
h4 Ticket Created By
p = ticket.user.name
p = ticket.user.company
p = ticket.user.phone
hr
p
 | Date Created:
 = ticket.created_at.not_nil!
p
 | Last Updated:
 = ticket.updated_at.not_nil!
p
  == link_to("Back", "/tickets", class: "btn btn-light btn-sm")
  == link_to("Edit", "/tickets/#{ticket.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/tickets/#{ticket.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
hr
h2 Comments
hr
== form(action: "/comments/#{comment.id.to_s}/comment", method: comment.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "body", value: comment.body, placeholder: "Your Comment", class: "form-control")
  == submit("Submit Comment", class: "btn btn-success btn-sm")

- comments.each do |comment|
  hr
  div.comment-blob
   p = comment.body
   p
    - if comment.user.role == 2
     i.tag.tag-blu Admin
    i #{comment.user.name} - #{comment.user.company}
   p
     == link_to("Delete", "/tickets/#{comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
css:
  .tag {color: white; padding: 4px 11px; margin:0 .5rem 0 0; border-radius: .5rem;}
  .tag-blu {background:cornflowerblue}
  .tag-orn {background:coral}
  .tag-st0 {background:grey}
  .tag-st1 {background:coral}
  .tag-st2 {background:cornflowerblue}
  .tag-lvl1 {background:coral}
  .tag-lvl2 {background:crimson}
  .comment-blob {border: 1px solid black; padding: 1rem 1rem 0 1rem; border-radius: .5em;}
