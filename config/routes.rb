Rails.application.routes.draw do
  resources :lixodones
  resources :lixotodos
  resources :quartos
  resources :cursos
  resources :residentes
  resources :periodos

  root :to => "residentes#index"
  get 'populate_lixotodos', to: 'application#populate_lixotodos', as: 'populate_lixotodos'
  get 'refresh_lixodones', to: 'application#refresh_lixodones', as: 'refresh_lixodones'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
