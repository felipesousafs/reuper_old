class Curso < ApplicationRecord
  has_many :residentes
  validates_presence_of :nome

end
