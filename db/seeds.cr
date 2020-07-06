require "../config/application"

# This file is for setting up your seeds.
#
# To run seeds execute `amber db seed`

# Example:
# User.create(name: "example", email: "ex@mple.com")

User.create(
  name: "Admin",
  email: "admin@example.org",
  phone: 423,
  approved: 1,
  role: 2,
  password: "testtest",
)
