class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attribute :user do |o|
    o.user.id
  end

  attribute :location do |o|
    o.location.id
  end

  attribute :current_weather do |o|
    WeatherForecast.new(location: o.location.name).today.hsh
  end
end
