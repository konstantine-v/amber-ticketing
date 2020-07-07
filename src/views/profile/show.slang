button
  == link_to("Edit Account", "/profile/edit", class: "btn btn-success btn-sm")
hr
h1 Profile
p = user.name
p = user.company
p = user.email
p = user.phone
hr
p If you need to delete your account please email the admin.
