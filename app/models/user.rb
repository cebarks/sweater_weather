class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email

  after_create :generate_api_key

  private

  def generate_api_key
    self.api_key = Digest::SHA2.hexdigest email
    self.save
  end
end
