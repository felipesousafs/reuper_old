class LixotodosController < ApplicationController
  before_action :set_lixotodo, only: [:show, :edit, :update, :destroy]


  # GET /lixotodos
  # GET /lixotodos.json
  def index
    @lixotodos = Lixotodo.order("data")
  end

  # GET /lixotodos/1
  # GET /lixotodos/1.json
  def show
  end

  # GET /lixotodos/new
  def new
    @lixotodo = Lixotodo.new
  end

  # GET /lixotodos/1/edit
  def edit
  end

  # POST /lixotodos
  # POST /lixotodos.json
  def create
    @lixotodo = Lixotodo.new(lixotodo_params)

    respond_to do |format|
      if @lixotodo.save
        format.html { redirect_to @lixotodo, notice: 'Lixotodo was successfully created.' }
        format.json { render :show, status: :created, location: @lixotodo }
      else
        format.html { render :new }
        format.json { render json: @lixotodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lixotodos/1
  # PATCH/PUT /lixotodos/1.json
  def update
    respond_to do |format|
      if @lixotodo.update(lixotodo_params)
        format.html { redirect_to @lixotodo, notice: 'Lixotodo was successfully updated.' }
        format.json { render :show, status: :ok, location: @lixotodo }
      else
        format.html { render :edit }
        format.json { render json: @lixotodo.errors, status: :unprocessable_entity }
      end
    end
  end

  def name
    respond_to do |format|
      format.html { "Tabela de lixo a ser cumprida" }
    end
  end
  # DELETE /lixotodos/1
  # DELETE /lixotodos/1.json
  def destroy
    @lixotodo.destroy
    respond_to do |format|
      format.html { redirect_to lixotodos_url, notice: 'Lixotodo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lixotodo
      @lixotodo = Lixotodo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lixotodo_params
      params.require(:lixotodo).permit(:residente_id, :data)
    end
end
