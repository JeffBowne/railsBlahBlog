module ProfilesHelper
  def present_check(object)
    object.present? ? true : false
  end

  def which_person(person)
    person.present? ? true : false
  end
end
