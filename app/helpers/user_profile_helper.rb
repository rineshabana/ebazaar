module UserProfileHelper
  def fullname(profile)
    if profile.middle_name.empty?
      "#{profile.first_name} #{profile.last_name}"
    else
      "#{profile.first_name} #{profile.middle_name} #{profile.last_name}"
    end
  end

  def showgender(profile)
    if profile.gender == 1
      'Male'
    else
      'Female'
    end
  end

  def show_contact_no(profile)
    "+#{profile.country_code}-#{profile.contact_number}"
  end
end
