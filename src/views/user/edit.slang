button
 == link_to("Back To Profile", "/users/#{user.id}", class: "btn btn-light btn-sm p-1 mb-3")
hr
h1 Edit Profile
- if user.errors
 div class="mini-alert alert-danger" role="alert"
  - user.errors.each do |error|
    li = error.to_s
== form(action: "/users/#{user.id}", method: :patch) do
  == csrf_tag
  input.form-control required="true" type="email" name="email" placeholder="Email" value="#{user.email}"
  == text_field(name: "name", required: true, value: user.name, placeholder: "Full Name")
  == text_field(name: "company", required: true, value: user.company, placeholder: "Company Name")
  input.form-control required="true" type="text" name="phone" placeholder="Phone Number" value="#{user.phone}"
  textarea.form-control type="text" name="about" placeholder="Description about you or company" value="#{user.about}"
  label Approved?
  == select_field(name: "approved", collection: [[0, "Not Approved"], [1, "Approved"]], selected: user.approved)
  == submit("Update")
