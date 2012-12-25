ENV['FB_APP_ID'] = "263882923741158"
ENV['FB_APP_SECRET'] = "2c92eeaeddaa925badb693220bd52dc6"
ENV['TW_CONSUMER_KEY'] = "kmPQUKz2LXgCILLKCizuPQ"
ENV['TW_CONSUMER_SECRET'] = "iyehzcukosh7yMzDB3oxDls9IbzGWU5tgBxK4QIMjY"
ENV['TW_TOKEN'] = "553365516-9byNm3UnAAVwRSm8dRArQ6J1Ca9G39nVKTZw1boX"
ENV['TW_TOKEN_SECRET'] = "kyzGBs90XZsUTsoPQ6t9HxSh1ORG74GZDqWV12II4"

Refame::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  if config.respond_to?(:action_mailer)
    config.action_mailer.raise_delivery_errors = false
  end

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict
  config.assets.paths << "#{Rails.root}/app/assets/videos"
  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
