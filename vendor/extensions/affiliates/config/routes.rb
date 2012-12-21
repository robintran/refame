Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :affiliates do
    resources :affiliates, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :affiliates, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :affiliates, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
