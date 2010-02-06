# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_session',
  :secret      => '1013a93dfc2bfb8cd4f38b802b5c557a1185633630648b3d2af7788f2eb8253403a4ca1240b7a074bbfd516596e9792a06ea1373194a523ebc1b26d60735e51f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
