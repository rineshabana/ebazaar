class UserProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :user_profile, only: %i[edit show]
  def show
    return unless @profile.nil?

    flash[:notice] = t('profile.create.message')
    @profile = UserProfile.new
    @create = true
  end

  def edit; end

  def create
    @profile = UserProfile.new(profile_params)
    @profile.user = current_user
    flash.now[:notice] = if @profile.save
                           t('profile.create.success')
                         else
                           t('profile.create.failure')
                         end
  end

  def update
    @profile = current_user.user_profile
    @profile.update(profile_params)
    flash.now[:notice] = t('profile.update.success')
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
