Rails.application.routes.draw do

  get 'donators/new'
  root 'static_pages#home'

  get  '/help',       to: 'static_pages#help'
  get  '/about',      to: 'static_pages#about'
  get  '/contact',    to: 'static_pages#contact'
  get  '/signup',     to: 'users#new'
  get  '/send',       to: 'messages#mail'
  get  '/apt',        to: 'donators#index_apt'
  get  '/sendapt',    to: 'donators#mail_apt'
  get  '/sendonator', to: 'donators#mail_donator'
  get  '/search',     to: 'donators#search'
  get  '/lot',        to: 'donators#lot_search'
  get  '/models',     to: 'sms_models#index'
  get  '/newmodel',   to: 'sms_models#new'
  get  '/donations',  to: 'donations#index'

  resources :messages
  resources :donators
  resources :sms_models
  resources :donations
end
