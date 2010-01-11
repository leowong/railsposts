# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railsposts_session',
  :secret      => 'a0f76ba6b6e80c3f32495a1d77a5661d4a52ec9f0e41a8a50cd262a43d173416f9c6668e91afd4232dc05d06ee6a77054f4765065da7911358eb0054e83bed23'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
