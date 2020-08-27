h1 Create User
- if user.errors
  - user.errors.each do |error|
   div.mini-alert.alert-danger role="alert"
    = error.to_s
form action="/registration" method="post"
  == csrf_tag
  input.form-control required="true" type="email" name="email" placeholder="Your Company Email"
  input.form-control required="true" type="text" name="name" placeholder="Your Name"
  input.form-control required="true" type="text" name="company" placeholder="Company Name"
  input.form-control required="true" type="phone" name="phone" placeholder="Phone Number"
  textarea.form-control type="text" name="about" placeholder="Description about you or company" value="#{user.about}"
  br
  input.form-control required="true" type="password" name="password" placeholder="Password"
  br
  button.btn.btn-success.btn-sm type="submit"
    | Register
hr
h3
 == link_to("Already have an account?", "/signin")
