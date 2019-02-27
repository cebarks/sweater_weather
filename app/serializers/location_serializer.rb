class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :lat do |o|
    o.lat
  end

  attribute :long do |o|
    o.long
  end
end
