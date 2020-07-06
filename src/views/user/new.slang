h1 Sign Up
p style="color:red"
 i Please note that after creating an account you'll have to wait for your account to be approved.
 i You won't be able to do anything on the site until being approved.
p style="color:red"
 i Please understand, this is to reduce spam on the site.
- if user
  - if user.errors
    ul.errors
    - user.errors.each do |error|
      li = error.to_s
form action="/registration" method="post"
  == csrf_tag
  .form-group
    input.form-control required="true" type="email" name="email" placeholder="Your Company Email"
  .form-group
    input.form-control required="true" type="text" name="name" placeholder="Your Name"
  .form-group
    input.form-control required="true" type="phone" name="phone" placeholder="Phone Number"
  .form-group
    input.form-control required="true" type="text" name="company" placeholder="Company Name"
  .form-group
    input.form-control type="text" name="about" placeholder="Description about you or company" value="#{user.about}"
  .form-group
    input.form-control required="true" type="password" name="password" placeholder="Password"
  button.btn.btn-success.btn-sm type="submit"
    | Register
hr
== link_to("Already have an account?", "/signin")
