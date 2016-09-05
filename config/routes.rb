Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :nearest_courses, only: [:index]
    end
  end
end
