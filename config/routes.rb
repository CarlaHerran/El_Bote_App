Rails.application.routes.draw do
  root    'static_pages#home'
  get     '/help',        		                     to: 'static_pages#help'
  get     '/about',       		                     to: 'static_pages#about'
  get     '/contact',     		                     to: 'static_pages#contact'
  get     '/signup',      		                     to: 'users#new'
  get     '/login',       		                     to: 'sessions#new'
  delete  '/logout',      		                     to: 'sessions#destroy'
  get     '/records',    		                       to: 'records#exes',        				     as: 'records'
  get     '/records/new',                          to: 'records#new',        			         as: 'new_record'
  get     '/products',   		                       to: 'products#product_options',         as: 'products'
  get     '/categories', 		                       to: 'categories#category_options',      as: 'categories'
  get     '/stats',      		                       to: 'stats#show_stats',        			   as: 'stats'
  get     '/records/:record_id/edit',              to: 'records#edit',                     as: 'edit_record'
  delete  '/records/:record_id/destroy',           to: 'records#destroy',                  as: 'destroy_record'


  post '/records/:record_id/update', to: 'records#update',                  as: 'update_record'
  post   '/login',                   to: 'sessions#create'
  post    '/records',                to: 'records#create',                  as: 'create_record'
  
  resources :users
end