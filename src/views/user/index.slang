a href="/users/new"
  button.success New User
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
          a href="/users/#{user.id}"
            button Show
          a href="/users/#{user.id}/edit"
            button Edit
