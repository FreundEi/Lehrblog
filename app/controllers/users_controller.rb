class UsersController < ApplicationController
  def index
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
end
