Mp3::Application.routes.draw do

  resources :playlists, :only => [:new, :create, :show]

  resources :mp3tunes, :except => [:edit, :update] do
    resources :ratings, :only => [:new, :create]
  end

  root :to => "home#index"

end
