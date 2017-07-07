class Residente < ApplicationRecord
  belongs_to :curso
  belongs_to :quarto

  def quarto
    @quarto = Quarto.find(self.quarto_id)
  end
  def curso
    @curso = Curso.find(self.curso_id)
  end
end
