class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :seller], multiple: true)                                       ##
  ############################################################################################

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :user_addresses, through: :user_profile

  def roles=(v)
    self[:roles] = v.map(&:to_sym).to_a.select{|r| r.size > 0 && ROLES.include?(r)}
  end

  def time_zone
    @time_zone ||= user_profile.time_zone
    @time_zone
  end
end
