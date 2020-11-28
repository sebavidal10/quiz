Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :exams do 
    get 'open', to: 'exams#open', as: 'exam_open'
    get 'result', to: 'exams#result', as: 'exam_result'
    post 'eval', to: 'exams#eval', as: 'exam_eval'
    resources :questions do 
      resources :options
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
