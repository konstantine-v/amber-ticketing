require "../config/application"

# This file is for setting up your seeds.
#
# To run seeds execute `amber db seed`

# Example:
# User.create(name: "example", email: "ex@mple.com")

User.create(
  name: "admin",
  email: "test@email.org",
  phone: 423,
  approved: 1,
  role: 1,
  password: "testtest",
)

Ticket.create(
  title: "TEST",
  desc: "test ticket",
  urgency: 2,
  solved: 0,
)
