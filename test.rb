# url = "https://ws.homeaway.com/public"

# url_search = "https://ws.homeaway.com/public/search"



# curl url_search \
# --user "caspyin" \
# --data '{"scopes":["gist"],"note":"Demo"}'


# Basic Auth YjJiNzExNTItY2E5Ny00Yzk4LWE3OTctMDk5MmVjOGU0YjY6YmRiYzFiMzEtNjViMS00YzVhLWExMzUtMmU2NGUwN2QxMzQ0


# Authorization: Basic YjJiNzExNTItY2E5Ny00Yzk4LWE3OTctMDk5MmVjOGU0YjY6YmRiYzFiMzEtNjViMS00YzVhLWExMzUtMmU2NGUwN2QxMzQ0

require 'homeaway_api'
client = HomeAway::API::Client.new(client_id: 'your_client_id', client_secret: 'your_client_secret')
