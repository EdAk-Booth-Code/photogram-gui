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
end