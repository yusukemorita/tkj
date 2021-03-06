class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  if Rails.env == 'production'
    before_action :authenticate_user!, only: [:edit, :update, :destroy]
  end

  def top
    @places_num = Place.all.size
  end

  def index
    @q = Place.ransack(params[:q])
    if params[:prefecture].present?
      @prefecture = params[:prefecture]
      @places = Place.where(prefecture: params[:prefecture]).page(params[:page])
    elsif params[:q].present?
      @places = @q.result(distinct: true).page(params[:page])
    else
      @places = Place.all.page(params[:page])
    end
  end

  def map
    @places = Place.all
    @get_current = 'true' if params[:current].present?
    @search_latlng = Geocoder.search(params[:search], params: {language: :ja}).first.geometry["location"] if params[:search].present?
  end

  def about
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
    gon.hours = @place.hours
  end

  def create
    @place = Place.new(place_params)
    @place.hours = JSON.parse(params[:place][:hours]) if params[:place][:hours].present?
    if @place.save && params[:photo].present?
      # params[:photo] will be an array.
      # you can check total number of photos selected using params[:photo].count
      @place.photos.create(title: params[:photo].original_filename, image: params[:photo], source: params[:source] )
    end
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: '新規卓球場の登録ありがとうございます。' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @place.save && params[:photo].present?
      @place.photos.create(title: params[:photo].original_filename, image: params[:photo], source: params[:source] )
    end
    respond_to do |format|
      if @place.update(place_params)
        if params[:place][:hours].present?
          @place.hours = JSON.parse(params[:place][:hours]) 
          @place.save
        end
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:title, :url, :latitude, :longitude, :content, :address, :source, :hours)
    end
end
