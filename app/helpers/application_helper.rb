module ApplicationHelper

  def img(flat)
    if flat.photo.file.nil?
      return image_path('default-cover.jpg')
    else
      return cl_image_path flat.photo
    end
  end

  def avatar(user)
    if user.avatar.file.nil?
      image_path("logo.png")
    else
      user.avatar.url
    end
  end

  def is_landlord?(user)
    !user.flats.empty?
  end

  def is_tenant?(user)
    rentals = Rental.all
    tenants = rentals.map { |rental| rental.tenant_id }
    tenants.include?(user.id)
  end

  def tenant_pending?(user)
    rentals = Rental.all
    tenants = rentals.map { |rental| rental.tenant_email }
    tenants.include?(user.email)
  end

end
