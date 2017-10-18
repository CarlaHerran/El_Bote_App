Rails.application.routes.draw do
  root    'static_pages#home'
  get     '/help',        		                     to: 'static_pages#help'
  get     '/about',       		                     to: 'static_pages#about'
  get     '/contact',     		                     to: 'static_pages#contact'
  get     '/signup',      		                     to: 'users#new'
  get     '/login',       		                     to: 'sessions#new'
  delete  '/logout',      		                     to: 'sessions#destroy'
  get     '/records',    		                       to: 'records#exes',        				     as: 'records'
  get     '/products',                             to: 'products#product_options',         as: 'products'
  get     '/categories',                           to: 'categories#category_options',      as: 'categories'
  get     '/stats',                                to: 'stats#show_stats',                 as: 'stats'
  delete  '/records/:record_id/destroy',           to: 'records#destroy',                  as: 'destroy_record'
  post     '/records/:record_id/edit',             to: 'records#edit',                     as: 'edit_record'


  # post     '/users/:user_id',                     to: 'users#update',                       as: 'update_user'
  # get     '/records/new',                          to: 'records#new',                     as: 'new_record'
  post     '/records/new',                          to: 'records#new',        			       as: 'new_record'
  post  '/users/:id(.:format)',                     to: 'users#edit'
  post '/records/:record_id/update',                to: 'records#update',                  as: 'update_record'
  post   '/login',                                  to: 'sessions#create'
  post    '/records',                               to: 'records#create',                  as: 'create_record'
  
  resources :users
end



# root GET    /                                     static_pages#home
#           help GET    /help(.:format)                       static_pages#help
#          about GET    /about(.:format)                      static_pages#about
#        contact GET    /contact(.:format)                    static_pages#contact
#         signup GET    /signup(.:format)                     users#new
#          login GET    /login(.:format)                      sessions#new
#         logout DELETE /logout(.:format)                     sessions#destroy
#        records GET    /records(.:format)                    records#exes
#     new_record GET    /records/new(.:format)                records#new
#       products GET    /products(.:format)                   products#product_options
#     categories GET    /categories(.:format)                 categories#category_options
#          stats GET    /stats(.:format)                      stats#show_stats
#    edit_record GET    /records/:record_id/edit(.:format)    records#edit
# destroy_record DELETE /records/:record_id/destroy(.:format) records#destroy
#  update_record POST   /records/:record_id/update(.:format)  records#update
#                POST   /login(.:format)                      sessions#create
#  create_record POST   /records(.:format)                    records#create
#          users GET    /users(.:format)                      users#index
#                POST   /users(.:format)                      users#create
#       new_user GET    /users/new(.:format)                  users#new
#      edit_user GET    /users/:id/edit(.:format)             users#edit
#           user GET    /users/:id(.:format)                  users#show
#                PATCH  /users/:id(.:format)                  users#update
#                PUT    /users/:id(.:format)                  users#update
#                DELETE /users/:id(.:format)                  users#destroy
