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
            span
              == link_to("Show", "/users/#{user.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
css:
  .tag {color: white; padding: 4px 11px; margin:0 .5rem 0 0; border-radius: .5rem;}
  .tag-ap0 {background:coral}
  .tag-ap1 {background:cornflowerblue}
