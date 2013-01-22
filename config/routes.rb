DataTracker::Application.routes.draw do
  resources :event_data

  root to: "pages#home"
  resources :events

end
