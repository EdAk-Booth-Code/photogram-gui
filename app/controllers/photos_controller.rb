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

end