Rails.application.routes.draw do

  root 'home#index'

  resources :home
  resources :answers
  resources :exam
  
  get 'question/get-answers/:id' => 'question#get_answers'
  resources :question

  get 'done' => 'exam#done'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
