# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bookmak3_session',
  :secret      => '7b84d146e04e1dec6f86401e96ac217b696eb6fb9ac622390588a7a99536b9154ffca2ce1228780bc7a9827145f598fa2f7ad01192595fd39792925b6257cfa5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
