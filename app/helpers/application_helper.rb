module ApplicationHelper
  def show_contact_no(profile)
    "+#{profile.country_code}-#{profile.contact_number}"
  end
end
