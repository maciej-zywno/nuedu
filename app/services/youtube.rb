require 'google/api_client'
require 'google/api_client/client_secrets'

# This OAuth 2.0 access scope allows for full read/write access to the
# authenticated user's account.
YOUTUBE_SCOPE = 'https://www.googleapis.com/auth/youtube'
YOUTUBE_READ_WRITE_SCOPE = 'https://www.googleapis.com/auth/youtube.upload'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'


client = Google::APIClient.new
youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

class Youtube



    def initialize(scope)
    credentials = {

    }
    @authorization = Signet::OAuth2::Client.new(
      :authorization_uri => credentials[:authorization_uri],
      :token_credential_uri => credentials[:token_credential_uri],
      :client_id => credentials[:client_id],
      :client_secret => credentials[:client_secret],
      :redirect_uri => credentials[:redirect_uri],
      :scope => scope
    )
  end




# Initialize the client & Google+ API

    # Initialize OAuth 2.0 client    
    client.authorization.client_id = CLIENT_ID_FROM_API_CONSOLE
    client.authorization.client_secret = CLIENT_SECRET
    client.authorization.redirect_uri = '<YOUR_REDIRECT_URI>'
    
    client.authorization.scope = 'https://www.googleapis.com/auth/plus.me'

    # Request authorization
    redirect_uri = client.authorization.authorization_uri

    # Wait for authorization code then exchange for token
    client.authorization.code = '....'
    client.authorization.fetch_access_token!

    # Make an API call
    result = client.execute(
      :api_method => plus.activities.list,
      :parameters => {'collection' => 'public', 'userId' => 'me'}
    )

    puts result.data



end