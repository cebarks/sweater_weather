class DarkskyService
  def forecast(lat, long)
    conn.get("#{lat},#{long}").body
  end

  private

  def conn
    # FIXME: class variable instead of instance?
    @conn ||= Faraday.new(url: "https://api.darksky.net/forecast/#{ENV["DARKSKY_SECRET"]}")# do |faraday|
    #   faraday.response :json, :parser_options => { :symbolize_names => true }
    #   faraday.adapter Faraday.default_adapter
    # end
  end
end
