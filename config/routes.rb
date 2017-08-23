Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => redirect('/combatants')

  get '/combatants' => 'combatants#index'
  get 'combatants/new' => 'combatants#new'
  post 'combatants' => 'combatants#create'
  delete 'combatants' => 'combatants#destroy'
  
end
