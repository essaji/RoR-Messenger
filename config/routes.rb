Rails.application.routes.draw do
  devise_for :users

  root 'welcome#home'

  get 'conversations' => 'conversations#showlist'
  post 'conversations/new' => 'conversations#new'
  get 'conversations/new' => 'conversations#new'
  post 'conversations/post' => 'conversations/post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
