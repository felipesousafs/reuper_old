class ResidentesController < ApplicationController
  before_action :set_residente, only: [:show, :edit, :update, :destroy]

  # GET /residentes
  # GET /residentes.json
  def index
    @residentes = Residente.order("nome")
  end

  # GET /residentes/1
  # GET /residentes/1.json
  def show
  end

  def name
    respond_to do |format|
      format.html { "Residentes" }
    end
  end

  # GET /residentes/new
  def new
    @residente = Residente.new
  end

  # GET /residentes/1/edit
  def edit
  end

  # POST /residentes
  # POST /residentes.json
  def create
    @residente = Residente.new(residente_params)

    respond_to do |format|
      if @residente.save
        format.html { redirect_to @residente, notice: 'Residente was successfully created.' }
        format.json { render :show, status: :created, location: @residente }
      else
        format.html { render :new }
        format.json { render json: @residente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residentes/1
  # PATCH/PUT /residentes/1.json
  def update
    respond_to do |format|
      if @residente.update(residente_params)
        format.html { redirect_to @residente, notice: 'Residente was successfully updated.' }
        format.json { render :show, status: :ok, location: @residente }
      else
        format.html { render :edit }
        format.json { render json: @residente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residentes/1
  # DELETE /residentes/1.json
  def destroy
    @residente.destroy
    respond_to do |format|
      format.html { redirect_to residentes_url, notice: 'Residente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residente
      @residente = Residente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residente_params
      params.require(:residente).permit(:matricula, :nome, :curso_id, :quarto_id)
    end
end
