class User < ApplicationRecord
  belongs_to :quarto

  def self.authenticate(email, password)
    where("email = ? AND password = ?", email, password).first
    end
end
