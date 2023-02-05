class UserProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :user_profile, only: %i[edit show]
  def show
    redirect_to user_profile_add_path if @profile.nil?
  end

  def edit; end

  def create
    @profile = UserProfile.new(profile_params)
    @profile.user = current_user
    raise unless @profile.save

    redirect_to root_path
  end

  def add
    if user_profile.nil?
      @profile = UserProfile.new(user: current_user)
    else
      redirect_to root_path
    end
  end

  def update
    @profile = UserProfile.update(profile_params)
    redirect_to root_path
  end

  private

  def user_profile
    @profile = current_user.user_profile
  end

  def profile_params
    params.require(:user_profile).permit(%i[first_name middle_name last_name dob gender country_code
                                            contact_number])
  end
end
