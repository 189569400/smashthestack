Smashthestack::Application.routes.draw do
  devise_for :users, path: '', controllers: { sessions: 'sessions', registrations: 'registrations' }, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}, sign_out_via: [:post, :delete, :get]
  root to: "homes#show"
  resource :homes
  match '/faq', to: 'homes#faq', as: 'faq'
  match '/disclaimer', to: 'homes#disclaimer', as: 'disclaimer'
  authenticate do
    match '/irc', to: 'homes#irc', as: 'irc'
    match '/wargames', to: 'wargames#index', as: 'wargames'
    namespace :wargames do
      get 'blowfish' 
      get 'io'
      get 'tux'
      get 'amateria'
      get 'logic'
      get 'blackbox'
      get 'apfel'
    end
    resources :admins
  end
end
