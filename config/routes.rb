ActionController::Routing::Routes.draw do |map|
   map.root :controller => "index", :action => "top"
   map.connect '/:action', :controller => "index", :action => :action
   map.connect '/way/:name', :controller => "index", :action => 'find_by_way'
   map.connect ':controller/:action/:id'
   map.connect ':controller/:action/:id.:format'
end
