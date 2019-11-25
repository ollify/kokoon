module ApplicationHelper

  def cover_img(flat)
    if flat.photo.file.nil?
      return asset_path('default-cover.jpeg')
    else
      return cl_image_path @flat.photo
    end

end
