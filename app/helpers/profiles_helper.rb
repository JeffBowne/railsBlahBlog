module ProfilesHelper
  def present_check(object)
    object.present? ? true : false
  end
end
