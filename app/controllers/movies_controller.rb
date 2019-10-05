class MoviesController < ApplicationController
  
  include MoviesHelper

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # check if request parameters exist
    if(invalid_params())
      # redirect with request paraemerts from session and keep flash messages
      flash.keep
      redirect_to movies_path(ratings: params[:ratings], sort: params[:sort])
    else
      # filter with rating and sort if request paraemerts are there
      all_ratings = Movie.get_all_ratings
      @movies = Movie.with_ratings(sanitize_rating(all_ratings))
                     .get_sorted(params[:sort])
      @all_ratings = all_ratings
      # update session with new request parameters
      update_session()
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
