Rails.application.routes.draw do

  get("/directors/eldest", {:controller => "directors", :action => "wisest"})

  get("/directors/youngest", {:controller => "directors", :action => "foolish"})

  get("/directors/:an_id", {:controller => "directors", :action => "director_details"})

  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", {:controller => "directors", :action => "index"})

  get("/movies", {:controller => "directors", :action => "movie_index"})

  get("/movies/:an_id", {:controller => "directors", :action => "movie_details"})


end
