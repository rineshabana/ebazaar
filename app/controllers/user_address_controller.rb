class UserAddressController < ApplicationController
  before_action :authenticate_user!
  before_action :find_address, only: %i[edit destroy]

  def index
    @addresses = current_user.user_addresses
  end

  def new
    @address = UserAddress.new
  end

  def edit; end

  def create
    @address = UserAddress.new(address_params)
    @address.user_profile = current_user.user_profile
    raise unless @address.save

    redirect_to user_address_index_path
  end

  def update
    @address = UserAddress.update(address_params)
    redirect_to user_address_index_path
  end

  def destroy
    @address.destroy
    redirect_to user_address_index_path
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
