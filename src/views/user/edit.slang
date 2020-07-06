h1 Edit Profile
- if user.errors
  ul.errors
  - user.errors.each do |error|
    li = error.to_s
== link_to("Back To Profile", "/users/#{user.id}", class: "btn btn-light btn-sm p-1 mb-3")
== form(action: "/users/#{user.id}", method: :patch) do
  == csrf_tag
  .form-group
    input.form-control required="true" type="email" name="email" placeholder="Email" value="#{user.email}"
  .form-group
    input.form-control required="true" type="text" name="name" placeholder="Full Name" value="#{user.name}"
  .form-group
    input.form-control required="true" type="text" name="company" placeholder="Company Name" value="#{user.company}"
  .form-group
    input.form-control required="true" type="text" name="phone" placeholder="Phone Number" value="#{user.phone}"
  .form-group
    textarea.form-control type="text" name="about" placeholder="Description about you or company" value="#{user.about}"
  .form-group
    label Approved?
    == select_field(name: "approved", collection: [[0, "Not Approved"], [1, "Approved"]], selected: user.approved)
  == submit("Update", class: "btn btn-success btn-sm")
