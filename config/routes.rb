Rails.application.routes.draw do
get   'sessions/new'
root   'static_pages#home'
get    'contact' => 'static_pages#contact'
get    'about' => 'static_pages#about'
 # get 'restaurant' => 'static_pages#restaurant'
get    'signup'  => 'users#new'
get    'login'   => 'sessions#new'
post  'login'   => 'sessions#create'
delete  'logout'  => 'sessions#destroy'
resources :users
get 'new_menu' => 'menus#new'
resources :restaurants do 
    resources :menus
end

get '/order' => 'order#index'
get '/order/clear' => 'order#clearorder'
get '/order/:id' => 'order#add'
get 'checkout' => 'order#checkout'
 
end