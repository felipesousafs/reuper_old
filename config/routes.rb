Rails.application.routes.draw do
  resources :lixodones
  resources :lixotodos
  resources :quartos
  resources :cursos
  resources :residentes
  resources :periodos

  get 'populate_lixotodos', to: 'application#populate_lixotodos', as: 'populate_lixotodos'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
