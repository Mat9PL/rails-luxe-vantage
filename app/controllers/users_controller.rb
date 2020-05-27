class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)

    redirect_to user_path(@user)
  end

private

def user_params
  params.require(:user).permit(:email, :photo)
end

def set_user
  @user = User.find(params[:id])
end

end
