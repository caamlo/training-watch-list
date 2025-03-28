class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = current_user.lists.find(params[:list_id])  # Trouve la liste
    @bookmark = Bookmark.new
    @movies = Movie.all  # Toutes les options de films disponibles
  end

  def create
    @list = current_user.lists.find(params[:list_id])
    @Movie = Movie.find(params[:bookmark][:movie_id])  # Récupère le film choisi
    @bookmark = Bookmark.new(list: @list, movie: @movie)

    if @bookmark.save
      redirect_to @list, notice: "Film ajouté à la liste."
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: "Signet supprimé."
  end
end
