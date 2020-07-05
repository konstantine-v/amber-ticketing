h1 Profile
p = user.name
p = user.company
p = user.email
p = user.phone
hr
p
  == link_to("Edit Account", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete Account", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
