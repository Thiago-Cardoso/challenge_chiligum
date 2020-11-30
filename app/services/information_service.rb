class InformationService
  def initialize(id)
    @id = id
  end

  def call
    episodes_ids  = self.character
    air_date = self.episodes episodes_ids
    return result = {"id" => @id, "air_date" => air_date}
  end

  private 

  def parse_request(request)
    JSON.parse(request.body)
  end

  def character
    url = "https://rickandmortyapi.com/api/character/#{@id}"
    parse_episodes = self.request_url(url)
    episode_ids = parse_episodes['episode'].map { |episode_id| episode_id.scan(/\d+/) }
    ep_id = "#{episode_ids.join(',')}"
    ep_id
  end

  def episodes ep_id
    url = "https://rickandmortyapi.com/api/episode/#{ep_id}"
    parse_episode = self.request_url url
    if ep_id.include? ","
      air_dates = parse_episode.map { |episode| episode['air_date'].strip.to_datetime.to_i}
      first_air_dates = air_dates.sort[0] + 10800
    else 
      air_dates = parse_episode['air_date'].strip.to_datetime.to_i 
      first_air_dates = air_dates + 10800
    end
    air_date_format_convert = Time.at(first_air_dates).strftime("%d/%m/%Y")
    air_date_format_convert
  end

  def request_url url
    begin
      response = RestClient.get "#{url}"
      parse = parse_request(response)
      parse
    rescue RestClient::ExceptionWithResponse => e
        e.response
    end
  end
end