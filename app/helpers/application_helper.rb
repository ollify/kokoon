module ApplicationHelper

  def cover_img(flat)
    if flat.photo.file.nil?
      return image_path('default-cover.jpeg')
    else
      return cl_image_path @flat.photo
    end
  end

end
