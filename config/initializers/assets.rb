# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( signup.css )
Rails.application.config.assets.precompile += %w( problems.css )
Rails.application.config.assets.precompile += %w( leaderboard.css )
Rails.application.config.assets.precompile += %w( medium-editor/medium-editor.css )
Rails.application.config.assets.precompile += %w( medium-editor/themes/default.css )
Rails.application.config.assets.precompile += %w( error.css )
Rails.application.config.assets.precompile += %w( submissions.css )
Rails.application.config.assets.precompile += %w( profile.css )