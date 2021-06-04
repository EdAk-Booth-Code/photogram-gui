class UsersController < ApplicationController

  def index
    matching_user = User.all

    @list_of_users = matching_user.order({ :username => :asc})
    render(:template => "user_templates/index.html.erb")
  end

  def show_user
    input_username = params.fetch("username")

    @user_info = User.where({ :username => input_username}).first
    render(:template => "user_templates/show.html.erb")
  end

  def create
    input_username = params.fetch("input_username")
  
    new_user = User.new

    new_user.username = input_username

    new_user.save


    redirect_to("/users")
  end

  def update
    new_username = params.fetch("input_username")
    user_id = params.fetch("path_id")

    user_to_update = User.where({ :id => user_id}).first

    user_to_update.username = new_username

    user_to_update.save

    redirect_to("/users/"+ user_to_update.username )
  end
end