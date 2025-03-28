class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = current_user.lists.find(params[:list_id])  # Trouve la liste
    @bookmark = Bookmark.new
    @movies = Movie.all  # Toutes les options de films disponibles
  end

  def create
    @list = current_user.lists.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "Film ajouté à la liste."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: "Signet supprimé."
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
