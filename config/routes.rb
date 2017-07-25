Rails.application.routes.draw do
  resources :lixodones
  resources :lixotodos do
    resource :download, only: [:show]
  end
  resources :quartos
  resources :cursos
  resources :residentes
  resources :periodos

  root :to => "residentes#index"
  get 'tabela/lixo', to: 'downloads#show', as: 'tabela/lixo'
  get 'populate_lixotodos', to: 'application#populate_lixotodos', as: 'populate_lixotodos'
  get 'refresh_lixodones', to: 'application#refresh_lixodones', as: 'refresh_lixodones'
  get 'populate_residentes', to: 'application#populate_residentes', as: 'populate_residentes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
