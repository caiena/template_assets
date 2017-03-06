# Template Assets - organizing your assets!

Template Assets provides a way to separate _template specific_ assets (i.e. your `User` `<form>` specific logic) from _app-wide assets_ (like your graph library) in a simple Rails-way naming convention.

Your `users#show` _action_ should render a `show.html.*` _template_, right? Template Assets tries to _ease_ organizing and including this _template-specific_ assets by searching for (if exists) the corresponding `show.js.*` and `show.css.*` assets.

```
# Your html template file location
- app
  +- views
     +- users
        +- show.html.haml

===

# Your "template assets" location
- app
  +- assets
     +- javascripts
     |  +- views
     |     +- users
     |        +- show.js.coffee
     +- stylesheets
        +- views
           +- users
              +- show.css.scss
```


# Install

Add the following to your Gemfile:
```
gem 'template_assets', github: 'caiena/template_assets'
```
and run `bundle install` from your shell.

After installing the gem, setup it on your Rails app with:
```
rails g template_assets:install
```

It should create an _initializer_ at `config/initializers/template_assets.rb`.


And, finally, add to your _layouts_ (check the `ADD THIS!` comments):
```
# ex: app/views/layouts.application.html.haml
%html
  %head
    %meta{:content => "text/html; charset=UTF-8", "http-equiv" => "Content-Type"}/
    %title Lise
    = csrf_meta_tags
    = stylesheet_link_tag    'application', media: 'all'

    -# ADD THIS!
    -# Enabling template javascripts
    = template_stylesheet_link_tag_if_exists

  %body
    -# your markup here...

    = javascript_include_tag 'application'
    -# ADD THIS!
    -# Enabling template javascripts
    = template_javascript_include_tag_if_exists
```

And _vòila_!
