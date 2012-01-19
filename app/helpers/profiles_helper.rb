module ProfilesHelper
  def get_location_for(user)
    unless user.profile.zipcode.blank?
      zipcode = ZipCode.where(:zipcode => user.profile.zipcode).first
      "#{zipcode.city.humanize}, #{zipcode.state.humanize}"
    end
  end
end
