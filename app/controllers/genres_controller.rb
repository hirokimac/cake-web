class GenresController < ApplicationController

  before_action :authenticate_user!

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to user_path(current_user.id), notice:"You have created genre successfully."
  else
      render :create
  end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def index
    @genres = Genre.all
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to user_path(current_user.id)
  end

  private
    def genre_params
        params.require(:genre).permit(:name)
    end

end
