ActionController::Routing::Routes.draw do |map|
  map.resources :articles

  map.resources :documents

  map.resources :people

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.signup '/signup/:invitation_token', :controller => 'users', :action => 'new'
  
  map.importpeople '/import_people', :controller => 'import_people', :action => 'index'
  map.csvimportpeople '/import_people/csv_import', :controller => 'import_people', :action => 'csv_import'
  
  map.root :controller => "user_sessions", :action => "new"
end
