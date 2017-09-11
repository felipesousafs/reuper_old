class LixotodosController < ApplicationController
  before_action :set_lixotodo, only: [:show, :edit, :update, :destroy]
  before_filter :require_authentication,
                :only => [:new, :edit, :create, :update, :destroy]


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
        format.html {redirect_to @lixotodo, notice: 'Registro criado com sucesso!'}
        format.json {render :show, status: :created, location: @lixotodo}
      else
        format.html {render :new}
        format.json {render json: @lixotodo.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /lixotodos/1
  # PATCH/PUT /lixotodos/1.json
  def update
    respond_to do |format|
      lixotodo_sub = Lixotodo.find(params[:lixotodo_sub_id])
      lixotodo_sub.destroy
      if @lixotodo.update(lixotodo_params)
        refresh_lixotodo_after_edit(@lixotodo)
        format.html {redirect_to populate_lixotodos_path, notice: 'Tabela de lixo atualizada com sucesso.'}
        format.json {render :show, status: :ok, location: @lixotodo}
      else
        format.html {render :edit}
        format.json {render json: @lixotodo.errors, status: :unprocessable_entity}
      end
    end
  end

  def name
    respond_to do |format|
      format.html {"Tabela de lixo"}
    end
  end

  # DELETE /lixotodos/1
  # DELETE /lixotodos/1.json
  def destroy
    @lixotodo.destroy
    respond_to do |format|
      format.html {redirect_to lixotodos_url, notice: 'Registro excluído com sucesso.'}
      format.json {head :no_content}
    end
  end

  def tupla
    dia = Time.zone.parse(params[:data])
    if dia.on_weekend?
      respond_to do |format|
        format.html { redirect_to edit_lixotodo_path, notice: 'O dia não pode ser em um fim de semana.'}
      end
    else
      @lixotodos = Lixotodo.where("data = ?", params[:data])
      render :partial => "tupla", locals: {lixotodos: @lixotodos}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lixotodo
    @lixotodo = Lixotodo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lixotodo_params
    params.require(:lixotodo).permit(:residente_id, :data, :lixotodo_sub_id)
  end
end
