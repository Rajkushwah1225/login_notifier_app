Rails.application.routes.draw do
  devise_for :users

  root "home#index"   # or any other controller#action you created

  require "sidekiq/web"

  mount Sidekiq::Web => "/sidekiq"


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
