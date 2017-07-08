class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def populate_lixotodos
    @residentes = Residente.order('nome')
    @last = Lixotodo.last
    if @last.nil?
      @periodo = Periodo.last
      @start = @periodo.start
    else
      @start = @last.data
    end
    flag = 1
    @residentes.each do |residente|
      @lixotodo = Lixotodo.new
      @lixotodo.residente_id= residente.id
      if flag.zero?
        @lixotodo.data= @start
        @lixotodo.save
        @start = @start.next_day
        flag = 1
      else
        @lixotodo.data= @start
        @lixotodo.save
        flag = 0
      end
    end
    redirect_to lixotodos_path
  end
end
