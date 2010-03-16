# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_it-karma_session',
  :secret      => '6cf651a44f88cabc9af373fe8450f1e56bd142985a6a212c4490abffa034be27a67ee2c0a94d0f7e84079f06f21b1ec6986145251cce8d84448b7eef2af9087b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
