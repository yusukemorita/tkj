class Photo < ActiveRecord::Base

  #Mounts paperclip image
  belongs_to :place
  has_attached_file :image
  #This validates the type of file uploaded. According to this, only images are allowed.
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #Index action, photos gets listed in the order at which they were created
  def index
    @photos = Photo.order('created_at')
  end

  #New action for creating a new photo
  def new
    @photo = Photo.new
  end

  #Create action ensures that submitted photo gets created if it meets the requirements
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully added new photo!"
      redirect_to root_path
    else
      flash[:alert] = "Error adding new photo!"
      render :new
    end
  end

  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def photo_params
    params.require(:photo).permit(:title, :image)
  end

end
