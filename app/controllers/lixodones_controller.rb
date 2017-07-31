class LixodonesController < ApplicationController
  before_action :set_lixodone, only: [:show, :edit, :update, :destroy]
  before_filter :require_authentication,
                :only => [:new, :edit, :create, :update, :destroy]

  # GET /lixodones
  # GET /lixodones.json
  def index
    @lixodones = Lixodone.all
  end

  # GET /lixodones/1
  # GET /lixodones/1.json
  def show
  end

  # GET /lixodones/new
  def new
    @lixodone = Lixodone.new
  end

  # GET /lixodones/1/edit
  def edit
  end

  def name
    respond_to do |format|
      format.html { "Tabela de lixo já cumprida" }
    end
  end

  # POST /lixodones
  # POST /lixodones.json
  def create
    @lixodone = Lixodone.new(lixodone_params)

    respond_to do |format|
      if @lixodone.save
        format.html { redirect_to @lixodone, notice: 'Lixodone was successfully created.' }
        format.json { render :show, status: :created, location: @lixodone }
      else
        format.html { render :new }
        format.json { render json: @lixodone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lixodones/1
  # PATCH/PUT /lixodones/1.json
  def update
    respond_to do |format|
      if @lixodone.update(lixodone_params)
        format.html { redirect_to @lixodone, notice: 'Lixodone was successfully updated.' }
        format.json { render :show, status: :ok, location: @lixodone }
      else
        format.html { render :edit }
        format.json { render json: @lixodone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lixodones/1
  # DELETE /lixodones/1.json
  def destroy
    @lixodone.destroy
    respond_to do |format|
      format.html { redirect_to lixodones_url, notice: 'Lixodone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lixodone
      @lixodone = Lixodone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lixodone_params
      params.require(:lixodone).permit(:residente_id, :data)
    end
end
