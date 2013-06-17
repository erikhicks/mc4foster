Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :help_requests do
    resources :help_requests, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :help_requests, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :help_requests, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
