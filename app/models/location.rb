class Location < ApplicationRecord
  validates_presence_of :name, :location
  validates_uniqueness_of :name, :location

  def lat
    coords.first.to_f
  end

  def long
    coords.second.to_f
  end

  private

  def coords
    location.split(',')
  end
end
