Rails.application.routes.draw do
	resources :players
	resources :teams
	get 'new_contracts', to: 'contracts#new_contracts'
	get 'list_player', to: 'players#list_player'
	post 'add_players', to: 'contracts#add_players'
	get  'new_match',  to:'matchs#add_matchs'
	post 'fix_match', to:'matchs#fix_match'
	get   'schduled_matchs', to: 'matchs#schduled_matchs'
	get 'new_lineup', to: 'lineups#new_lineup'
	get  'view_lineup', to:'lineups#view_lineup'
	root 'players#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
