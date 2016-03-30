# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( images/logo.png )
Rails.application.config.assets.precompile += %w( blacklight.css.scss )
Rails.application.config.assets.precompile += %w( main.scss )
Rails.application.config.assets.precompile += %w( photographs.css.scss )
Rails.application.config.assets.precompile += %w( transcripts.css.scss )
Rails.application.config.assets.precompile += %w( tul_ohist.css.scss )
Rails.application.config.assets.precompile += %w( base/colors.css.scss )
Rails.application.config.assets.precompile += %w( base/globals.css.scss )
Rails.application.config.assets.precompile += %w( base/mixins.css.scss )

