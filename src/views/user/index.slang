.row
  .col-sm-11
    h2 Users
.table-responsive
  table.table.table-striped
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
              == link_to("Show", "/users/#{user.id}", class: "btn btn-info btn-sm")
            button
              == link_to("Edit", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
            button
              == link_to("Delete", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
css:
  .tag-ap0 {background:coral}
  .tag-ap1 {background:cornflowerblue}
