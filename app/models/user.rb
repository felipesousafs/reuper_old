class User < ApplicationRecord
  belongs_to :quarto
  validates_presence_of :email, :password, :full_name

  def self.authenticate(email, password)
    where("lower(email) = ? AND password = ?", email.downcase, password).first
    end
end
