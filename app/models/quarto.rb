class Quarto < ApplicationRecord
  has_many :residentes
  validates_presence_of :numero, :piso


end
