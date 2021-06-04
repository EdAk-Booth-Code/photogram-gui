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

end