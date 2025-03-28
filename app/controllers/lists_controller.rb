class ListsController < ApplicationController
   # Action pour afficher toutes les listes
   before_action :authenticate_user!

   def index
    @lists = current_user.lists
   end

   def show
     @list = current_user.lists.find(params[:id])
     @bookmarks = @list.bookmarks
     @bookmark = Bookmark.new
   end

   def new
    @list = List.new
   end

   def create
     @list = current_user.lists.build(list_params)

     if @list.save
       redirect_to @list, notice: 'La liste a été créée avec succès.'
     else
       render :new
     end
   end

   private

   def list_params
     params.require(:list).permit(:name, :photo)
   end
 end
