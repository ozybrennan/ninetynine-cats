Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:new, :create] do
    get 'approve' => 'cat_rental_requests#approve', as: 'approval'
    get 'deny' => 'cat_rental_requests#deny', as: 'denial'
  end
end
