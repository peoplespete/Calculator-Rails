Rails.application.routes.draw do
  root 'calculator#show'
  post 'calculate', to: 'calculator#calculate'
end
