module ApplicationHelper
  def show_contact_no(objekt)
    "+#{objekt.country_code}-#{objekt.contact_number}"
  end
end
