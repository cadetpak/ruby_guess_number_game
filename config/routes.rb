Rails.application.routes.draw do
root 'numbers#index'

post '/guess' => 'numbers#guess'
end
