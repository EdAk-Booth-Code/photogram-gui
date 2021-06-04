class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order( {:created_at => :desc })

    render(:template => "photo_templates/index.html.erb")
  end

  def show
    url_id = params.fetch("path_id")

    @the_photo = Photo.where({:id => url_id}).first
    render(:template => "photo_templates/show.html.erb")
  end

  def delete_photo
    photo_id = params.fetch("path_id")

    matching_photo = Photo.where( :id => photo_id).first

    matching_photo.destroy
    
    # render(:template => "photo_templates/index.html.erb")

    redirect_to("/photos")
  end

  def create
    photo_path = params.fetch("input_image")
    photo_caption = params.fetch("input_caption")
    photo_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new

    new_photo.image = photo_path
    new_photo.caption = photo_caption
    new_photo.owner_id = photo_owner_id

    new_photo.save
    
    redirect_to("/photos/"+ new_photo.id.to_s )
    
  end

  def update
    photo_path = params.fetch("input_image")
    photo_caption = params.fetch("input_caption")
    photo_owner_id = params.fetch("path_id")

    photo_to_update = Photo.where({ :id => photo_owner_id}).first

    photo_to_update.image = photo_path
    photo_to_update.caption = photo_caption

    photo_to_update.save

    redirect_to("/photos/"+ photo_to_update.id.to_s )
    # render(:template => "photo_templates/update.html.erb")
  end

end