class PhotosController < ApplicationController
  before_filter :find_gallery
  
  def index
    @photos = @gallery.photos
  end
  
  def new
    @photo = @gallery.photos.new
  end

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"fdoLXXzi//6k2DwCLBYKvhWHknS2Bsj8bua4VHfCm9s=", "photo"=>{"name"=>"fred", "file"=>#<ActionDispatch::Http::UploadedFile:0x007fbe6666eac8 @original_filename="coffee-ad.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"photo[file]\"; filename=\"coffee-ad.jpg\"\r\nContent-Type: image/jpeg\r\n", @tempfile=#<File:/var/folders/sb/h48p5_4j7y3_0wd4c52cr7340000gn/T/RackMultipart20120205-78681-g0dio2>>}, "commit"=>"Create Photo", "gallery_id"=>"1"}  
  def create
    @photo = @gallery.photos.new(params[:photo])
    if @photo.save
      redirect_to @gallery, :notice => 'Photo successfully uploaded'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
end