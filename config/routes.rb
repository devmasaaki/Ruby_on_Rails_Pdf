Rails.application.routes.draw do
  root 'formulation#index'
  get '/submit', to: 'formulation#submit'
  get '/get_all_formulations', to: 'formulation#get_all_formulations'
  get '/get_all_ingredients', to: 'formulation#get_all_ingredients'
  get '/get_formulation/:id', to: 'formulation#get_formulation', as: 'patient'
end
