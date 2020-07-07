doctype html
html
  head
    title Ticket Tracking App
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link rel="stylesheet" href="/css/dark.min.css"
    link rel="stylesheet" href="/css/main.min.css"
    link rel="apple-touch-icon" href="/favicon.png"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"
  body
   - flash.each do |key, value|
     div class="alert alert-#{key}" role="alert"
      = flash[key]
   nav
    table
     tr
      th
       a.navbar-brand href="/"
        img src="/logo.svg" height="30" alt="Amber logo"
      th
        == render(partial: "layouts/_nav.slang")
      th
        == render(partial: "layouts/_session.slang")
    == content
    - if Amber.settings.auto_reload?
      script src="/js/client_reload.js"
