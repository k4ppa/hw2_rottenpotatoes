class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #@movies = Movie.all
    flash[:title_color] = ''
    flash[:release_date_color] = ''
    
    if params[:id] == 'title_header'
#     @movies = Movie.find :all, :order => 'title'
      @movies = Movie.order(params[:sort])
      flash[:title_color] = 'hilite'
    elsif params[:id] == 'release_date_header'
#      @movies = Movie.find :all, :order => 'release_date DESC'
      @movies = Movie.order(params[:sort])
      flash[:release_date_color] = 'hilite'
    else
      @movies = Movie.all
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
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
