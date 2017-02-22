Rails.application.routes.draw do
  devise_for :users
  root    'home_page#index'
  get     '/doc',          to: 'home_page#documentation'
end
