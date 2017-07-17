class Residente < ApplicationRecord
  belongs_to :curso
  belongs_to :quarto
  validates_presence_of :nome, :curso_id, :quarto_id, :matricula
  validates_uniqueness_of :matricula

  def quarto
    @quarto = Quarto.find(self.quarto_id)
  end
  def curso
    @curso = Curso.find(self.curso_id)
  end
  # def self.search(term)
  #   if term.nil?
  #     all
  #   else
  #     where('ILIKE :term', term: "%#{term.downcase}%")
  #   end
  #
  # end
end
