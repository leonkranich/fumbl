class FacesApi
  def self.fetch_faces(number, gender)
    headers = {
      'X-API-KEY': '52e75b562b93f028183b0a09e37a7d'
    }
    response = HTTParty.get("https://uifaces.co/api?limit=#{number}&emotion[]=happiness&gender[]=#{gender}&?from_age=25&to_age=40",
      headers: headers
    )
    response.parsed_response
  end
end
