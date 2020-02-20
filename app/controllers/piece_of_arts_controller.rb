class PieceOfArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home


  def index
    @piece_of_arts = PieceOfArt.all
    @categories = @piece_of_arts.uniq do |poa|
      poa.category
    end
    # @piece_of_arts_filtered = PieceOfArt.find(params[:search]) #Doubt on hwo to write params here
  end

  def show
    @piece_of_art = PieceOfArt.find(params[:id])
  end

  def new
    @piece_of_art = PieceOfArt.new()
  end

  def create
    @piece_of_art = PieceOfArt.new(params_poa)
    @piece_of_art.user = current_user
    if @piece_of_art.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end



  private

  def params_poa
    params.require(:piece_of_art).permit(:name, :category, :daily_price, :description, :artist_name, :creation_date, :available_for_sale, :buying_price, :photo)
  end
end
