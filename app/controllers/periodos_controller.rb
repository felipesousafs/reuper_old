class PeriodosController < ApplicationController
  def new
    @periodo = Periodo.new
  end
  def create
    @periodo = Periodo.new(periodo_params)
    respond_to do |format|
      if @periodo.save
        format.html { redirect_to residentes_path, notice: 'Periodo was successfully created.' }
      else
        render :new
      end
    end
  end

  private
  def periodo_params
    params.require(:periodo).permit(:start, :end)
  end
end
