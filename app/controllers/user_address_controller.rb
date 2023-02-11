class UserAddressController < ApplicationController
  protect_from_forgery except: :index
  before_action :authenticate_user!
  before_action :find_address, only: %i[edit destroy]

  def index
    if current_user.user_profile.nil?
      render js: 'Please create your profile'
      return
    end
    @addresses = current_user.user_addresses
    flash[:notice] = t('profile.create.message') if current_user.user_profile.nil?
  end

  def new
    @address = UserAddress.new
  end

  def edit; end

  def create
    @address = UserAddress.new(address_params)
    @address.user_profile = current_user.user_profile
    if @address.save
      flash[:success] = t('address.create.success')
    else
      flash[:error] = t('address.create.failure')
    end
  end

  def update
    @address = current_user.user_addresses.find(params[:id])
    if @address.update(address_params)
      flash[:success] = t('address.update.success')
    else
      flash[:error] = t('address.update.failure')
    end
  end

  def destroy
    @address.destroy
    flash.now[:success] = t('address.delete')
  end

  private

  def find_address
    @address = current_user.user_addresses.find(params[:id])
  end

  def address_params
    params.require(:user_address).permit(%i[address_line1 address_line2 address_line3 city state pincode country_code
                                            contact_number])
  end
end
