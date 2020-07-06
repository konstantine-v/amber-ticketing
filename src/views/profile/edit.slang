h1 Edit Profile

- if user.errors
  ul.errors
  - user.errors.each do |error|
    li = error.to_s

== link_to("Back To Profile", "/profile", class: "btn btn-light btn-sm p-1 mb-3")
== form(action: "/profile", method: :patch) do
  == csrf_tag
  .form-group
    input.form-control type="email" name="email" placeholder="Email" value="#{user.email}"
  .form-group
    input.form-control required="true" type="text" name="name" placeholder="Name" value="#{user.name}"
  .form-group
    input.form-control required="true" type="text" name="company" placeholder="Company Name" value="#{user.company}"
  .form-group
    input.form-control required="true" type="text" name="phone" placeholder="Phone Number" value="#{user.phone}"
  .form-group
    textarea.form-control type="text" name="about" placeholder="Description about you or company" value="#{user.about}"
  br
  .form-group
    input.form-control type="password" name="password" placeholder="Your New password"
  == submit("Update", class: "btn btn-success btn-sm")
