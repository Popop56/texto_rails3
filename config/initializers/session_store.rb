# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_texto_rails3_session',
  :secret => 'ef0fc16280df2150b030dd94d35d473397999028fb1bbf3cf1820801a71712f5263eccb7aec7bbb6ec8db04b07a35702cec4a167d1e7f945394c2d28f64bb6d9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
