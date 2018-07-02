Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :checkings do

    resources :checkings, :path => '', :only => [:index, :new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :checkings, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}" do
      resources :checkings do 
  end

      scope :path => 'checkings' do
        resources :settings, :only => [:edit, :update]
      end
    end
  end
end

