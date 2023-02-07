class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all


    render({:template => "directors_template/index.html.erb"})
  end

  def movie_index
    @list_of_movies = Movie.all

    render({:template => "directors_template/movie_index.html.erb"})
  end

  def actor_index
    @list_of_actors = Actor.all

    render({:template => "directors_template/actor_index.html.erb"})
  end

  def wisest
    @oldest = Director.where.not({ :dob => nil}).order({:dob => :asc}).at(0)
    render({:template => "directors_template/eldest.html.erb"})
  end

  def foolish
    @youngest = Director.where.not({:dob => nil}).order({:dob => :desc}).at(0)
    render({:template => "directors_template/youngest.html.erb"})
  end

  def director_details
    # params looks like this {"an_id" => "42"}

    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id}).at(0)

    @filmography = Movie.where({:director_id => @the_director.id})

    render({:template => "directors_template/show.html.erb"})
  end

  def movie_details
    the_id = params.fetch("an_id")

    @the_movie = Movie.where({ :id => the_id}).at(0)

    render({:template => "directors_template/movie_show.html.erb"})
  end

  def actor_details
    the_id = params.fetch("an_id")

    @the_actor = Actor.where({ :id => the_id}).at(0)

    @characters = Character.where({:actor_id => @the_actor.id})
    #@movies = @characters.movie_id
    #@directors = Movie.where({:director_id => @movies.director_id})

    #@filmography = Movie.where({:director_id => @the_director.id})

    render({:template => "directors_template/actor_show.html.erb"})
  end

end
