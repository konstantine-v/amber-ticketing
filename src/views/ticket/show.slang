button
 == link_to("Back To Tickets", "/tickets")
button
 == link_to("Edit Ticket", "/tickets/#{ticket.id}/edit")
hr
h1 = ticket.title
span class="tag tag-st#{ticket.solved}"
 - if ticket.solved == 0
   | Status: Waiting
 - if ticket.solved == 1
   | Status: In-Progress
 - if ticket.solved == 2
   | Status: Resolved
 - if ticket.solved == 3
   | Status: Closed
- if ticket.urgency != 0
  span class="tag tag-lvl#{ticket.urgency}" Urgency: Level #{ticket.urgency}
h3 Description:
p = ticket.desc
p
 b URL to issue:
 a href="#{ticket.url}" = ticket.url
- if (current_user = context.current_user)
  - if current_user.role == 2
   p
    b Ticket Created By:
    a href="/users/#{ticket.user.id}"
     = ticket.user.name
     | -
     = ticket.user.company
    p
     b Date Created:
     = ticket.created_at.not_nil!.to_local.to_s("%Y-%m-%d %H:%M")
    p
     b Last Updated:
     = ticket.updated_at.not_nil!.to_local.to_s("%Y-%m-%d %H:%M")
hr
h2 Comments
- if comment.errors
  ul.errors
    - comment.errors.each do |error|
      li = error.to_s
== form(action: "/comments/#{ticket.id}/new", method: comment.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_area(name: "body", content: comment.body, placeholder: "Your Comment", class: "form-control")
  == submit("Submit Comment")
hr
br
- comments.each do |comment|
  div.comment-blob
   p = comment.body
   p
    - if comment.user.role == 2
     i.tag.tag-st2 Admin
    i #{comment.user.name} - #{comment.user.company}
    - if (current_user = context.current_user)
      - if current_user.id == comment.user.id || current_user.role == 2
        button
         == link_to("Delete", "/comments/#{comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?")
  br
css:
  .comment-blob {background:#2b3e4e;padding:1px 1rem 1px 1rem;border-radius:.5em;margin-bottom:1rem}
