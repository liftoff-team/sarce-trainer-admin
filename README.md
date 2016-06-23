# Sarce Trainer Admin

[![Code Climate](https://codeclimate.com/github/liftoff-team/sarce-trainer-admin/badges/gpa.svg)](https://codeclimate.com/github/liftoff-team/sarce-trainer-admin)
[![Codeship master](https://codeship.com/projects/159694/status?branch=master)]
[![Codeship production](https://codeship.com/projects/159694/status?branch=production)]
[![Build Status](https://travis-ci.org/liftoff-team/sarce-trainer-admin.svg?branch=master)](https://travis-ci.org/liftoff-team/sarce-trainer-admin)
[![Build Status](https://travis-ci.org/liftoff-team/sarce-trainer-admin.svg?branch=production)](https://travis-ci.org/liftoff-team/sarce-trainer-admin)

**Sarces Trainer is a mobile application that helps firefighters to update their knowledge by answering a daily question.**

# Ruby on Rails

This application requires:

- Ruby version 2.2
- Rails version 5.0.0
- Learn more about Installing Rails.

## Development

- Template Engine: Haml
- Front-end Framework: Twitter Bootstrap (Sass)
- Authentication: Devise
- Postgresql

# Getting Started

## How to build dev environment

- Install Ruby 2.2
- Install Bundler
- Install [PhantomJS](https://github.com/teampoltergeist/poltergeist)
- Install PostgreSQL
- Run `bundle install`
- Run migrations with rake db:migrate
- Follow [instructions to setup PostgreSQL](#how-to-configure-postgresql-on-linux)
- Run `rake db:setup`
- Run `bundle exec rails server` or `bundle exec guard`
