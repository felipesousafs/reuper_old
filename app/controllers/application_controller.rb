class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def populate_lixotodos
    @residentes = Residente.order('nome')
    last = Lixotodo.last
    if last.nil?
      @periodo = Periodo.last
      if @periodo.start < Date.current
        @start = Date.current
      else
        @start = @periodo.start
      end
    else
      @start = last.data.next_day
    end
    flag = 1
    @residentes.each do |residente|
      if pode_adicionar?(residente.id)
        @lixotodo = Lixotodo.new
        @lixotodo.residente_id= residente.id
        if flag.zero?
          @lixotodo.data= @start
          if @lixotodo.save
            @start = @start.next_day
            flag = 1
          end
        else
          @lixotodo.data= @start
          if @lixotodo.save
            flag = 0
          end
        end
        while @start.on_weekend?
          @start = @start.next_day
        end
      end
    end

    redirect_to lixotodos_path
  end
  def populate_lixodones(residente_id, data)
    @lixodone = Lixodone.new
    @lixodone.residente_id= residente_id
    @lixodone.data= data
    @lixodone.save
  end
  #Se a data atual for maior que a data da tarefa do residente, ele eh inserido na tabela de lixodone
  def refresh_lixodones
    lixotodos = Lixotodo.where('data < ?', Date.today)
    lixotodos.each do |lixotodo|
      populate_lixodones(lixotodo.residente_id, lixotodo.data)
    end
    redirect_to lixodones_path
  end

  def pode_adicionar?(residente_id)
    if Lixodone.exists?(residente_id: residente_id)
      false
    else
      true
    end
  end

end
