# Ticketing App

[![Amber Framework](https://img.shields.io/badge/using-amber_framework-orange.svg)](https://amberframework.org)

This is a simple ticketing application meant for use with customers to communicate issues with whomever is admin for the site. The main goal for this application is to be lightweight and to be fast to both deploy and run.

Users when joining need to be approved by an admin before being able to do anything, the reason for this is to prevent spam and to prevent people making multiple accounts for whatever reason.

There's an admin view and a user view where users can only see their tickets and create new ones, while admins can see all users and all tickets.

*Please Note:*

No email support currently, mailers are still WIP.

Delete action doesn't work currently, working on a fix right now.

If you want to help, feel free to make a PR and help out with this. If you do help out I will add you in the list of contributors.

## Getting Started

These instructions will get a copy of this project running on your machine for development and testing purposes.

Please see [deployment](https://docs.amberframework.org/amber/deployment) for notes on deploying the project in production.

Add your logo to `public/logo.svg`

Add whatever CSS to `public/` and change the reference in `src/views/layouts/application.slang`
## Prerequisites

This project requires [Crystal](https://crystal-lang.org/) ([installation guide](https://crystal-lang.org/docs/installation/)).

## Development

To start your Amber server:

1. Install dependencies with `shards install`
2. Build executables with `shards build`
3. Create and migrate your database with `bin/amber db create migrate`. Also see [creating the database](https://docs.amberframework.org/amber/guides/create-new-app#creating-the-database).
4. Start Amber server with `bin/amber watch`

Now you can visit http://localhost:3000/ from your browser.

Getting an error message you need help decoding? Check the [Amber troubleshooting guide](https://docs.amberframework.org/amber/troubleshooting), post a [tagged message on Stack Overflow](https://stackoverflow.com/questions/tagged/amber-framework), or visit [Amber on Gitter](https://gitter.im/amberframework/amber).

Using Docker? Please check [Amber Docker guides](https://docs.amberframework.org/amber/guides/docker).

## Tests

To run the test suite:

```
crystal spec
```

## Contributing

1. Fork it ( https://git.materialfuture.net/MaterialFuture/ticketing-app )
2. Create your feature branch ( `git checkout -b my-new-feature` )
3. Commit your changes ( `git commit -am 'Add some feature'` )
4. Push to the branch ( `git push origin my-new-feature` )
5. Create a new Pull Request

## Contributors

- [@materialfuture](https://git.materialfuture.net/MaterialFuture) Konstantine - creator, maintainer

## Goals
- Minimal CSS
- Very minimal JavaScript
- Restrict views based on roles (ie admin, user, potential others)
- Users must be approved by admin
  1. User signs up
  2. Admin gets email of new user
  3. Admin sees on dashboard the list of unapproved users and can take actions
- Email system to let admins and users get updates on their tickets
  - Emails on ticket status updates along with new comments
- Ticket features
  - Comments for tickets
  - File uploads for tickets
