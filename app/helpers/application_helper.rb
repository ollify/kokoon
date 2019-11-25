module ApplicationHelper

  def img(flat)
    if flat.photo.file.nil?
      return image_path('default-cover.jpeg')
    else
      return cl_image_path flat.photo
    end
  end

  def avatar(user)
    if user.avatar.file.nil?
      'logo.png'
    else
      user.avatar.url
    end
  end

end
