= Template Assets - organizing your assets! [![IPQ](https://img.shields.io/badge/ipq-passing-brightgreen.svg)](https://img.shields.io/badge/ipq-passing-brightgreen.svg)

# Why
- TODO

# How
- TODO

# What
- TODO

> Golden circle answered!


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
