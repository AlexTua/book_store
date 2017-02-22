Rails.application.routes.draw do
  root    'home_page#index'
  get     '/doc',          to: 'home_page#documentation'
end
