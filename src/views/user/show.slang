h1 Profile
p = user.name
p = user.company
p = user.email
p = user.phone
p
 span class="tag tag-ap#{user.approved}" #{user.approved == 0 ? "Not Approved" : "Approved"}
hr
p
  == link_to("Edit Account", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete Account", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
css:
  .tag {color: white; padding: 4px 11px; margin:0 .5rem 0 0; border-radius: .5rem;}
  .tag-ap0 {background:coral}
  .tag-ap1 {background:cornflowerblue}
