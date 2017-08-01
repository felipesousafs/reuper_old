class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  delegate :current_user, :user_signed_in?, :to => :user_session
  helper_method :current_user, :user_signed_in?
  before_filter :require_authentication,
                :only => [:populate_lixotodos, :populate_residentes, :populate_lixodones]


  #Autenticação de usuario DO
  def user_session
    UserSession.new(session)
  end
  def require_authentication
    unless user_signed_in?
      redirect_to new_user_sessions_path,
                  :alert => t('flash.alert.needs_login')
    end
  end
  def require_no_authentication
    redirect_to root_path if user_signed_in?
  end

  ## END
  def populate_residentes

    Residente.destroy_all
    file = File.read('app/assets/images/residentes.json')
    json = JSON.parse(file)

    matricula = 20120001
    json.each do |elemento|
      Residente.create(matricula: matricula, nome: elemento['nome'], curso_id: 1, quarto_id: 1)
      matricula = matricula+1
    end

    file2 = File.read('app/assets/images/matriculas_cursos.json')
    json2 = JSON.parse(file2)

    json2.each do |registro|
      residente = Residente.where(nome: registro['nome']).first
      if !residente.nil?
        curso_nome = registro['curso']
        curso = Curso.find_by_nome(curso_nome.to_s)
          residente.update(
              matricula: registro['matricula'],
              curso_id: curso.id
          )
      end
    end

    redirect_to residentes_path
  end

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
