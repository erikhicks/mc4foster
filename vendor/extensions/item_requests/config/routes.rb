Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :item_requests do
    resources :item_requests, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :item_requests, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :item_requests, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
