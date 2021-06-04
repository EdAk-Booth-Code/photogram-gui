Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:username", {:controller => "users", :action => "show_user"})

  get("/photos", { :controller => "photos", :action => "index"})


end
