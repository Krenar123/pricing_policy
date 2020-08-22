Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'model_type_prices/:group_organization_id', to: 'group_organizations#create_pricing'
end
