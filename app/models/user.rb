class User < ApplicationRecord
  validates_presence_of :email
  has_secure_password

  def api_key
    Digest::SHA2.hexdigest email
  end
end
