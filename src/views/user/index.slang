button.success
 a href="/users/new" New User
hr
h1 Users
table
  thead
    tr
      th ID
      th Name
      th Company
      th Phone
      th Approved
      th Actions
  tbody
    - users.each do |user|
      tr
        td = user.id
        td = user.name
        td = user.company
        td = user.phone
        td
          span class="tag tag-ap#{user.approved}" #{user.approved == 0 ? "No" : "Yes"}
        td
          button
            == link_to("Show", "/users/#{user.id}")
          button
            == link_to("Edit", "/users/#{user.id}/edit")
          - if user.role != 2
           form action="/users/#{user.id}?_csrf=#{csrf_token}" method="DELETE"
            == csrf_tag
            button.danger  type="submit" onclick="return confirm('Are you sure?');" Delete
