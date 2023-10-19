Rails.application.routes.draw do
  devise_for :users


  get 'musics/idol' => 'musics#idol'
  get 'musics/westernrock' => 'musics#westernrock'
  get 'musics/japaneserock' => 'musics#japaneserock'
  get 'musics/anime' => 'musics#anime'
  get 'musics/jpop' => 'musics#jpop'
  get 'musics/kpop' => 'musics#kpop'
  get 'musics/artist_songs/:id' => 'musics#artist_songs', as: :artist_songs
  get 'blogs/index'
  
  
  resources :users, only: [:show] 
 

  resources :musics
  resources :songs, only: [:new, :create, :show] do
    resources :likes, only: [:create, :destroy]
  end
  resources :blogs
  root 'musics#index'

end
