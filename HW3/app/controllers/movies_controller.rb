# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.order(params[:sort])
  end
  
  def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
  end
  
  def new
    # default: render 'new' template
    @movie = Movie.new
  end
  
  #Destructive method
  # def create
  #   #raise @params.inspect
  #   @movie = Movie.create!(movie_params)
  #   flash[:notice] = "#{@movie.title} was successfully created."
  #   redirect_to movies_path
  # end
  
  #Undestructive method
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      render 'new' # note, 'new' template can access @movie's field values!
    end
  end
  
  def edit
  @movie = Movie.find params[:id]
  end
  
  #Destructive method
  # def update
  #   @movie = Movie.find params[:id]
  #   @movie.update_attributes!(movie_params)
  #   flash[:notice] = "#{@movie.title} was successfully updated."
  #   redirect_to movie_path(@movie)
  # end
  
  #Undestructive method
  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    else
      render 'edit' # note, 'edit' template can access @movie's field values!
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
 
  private
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date, :timestamps)
  end
  
end
