class Lixodone < ApplicationRecord
  has_many :residentes
  validates_uniqueness_of :residente_id

  def residente
    @residente = Residente.find(self.residente_id)
  end
end
