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
      image_path("user2.png")
    else
      user.avatar.url
    end
  end

  def rental_user(rental)
    @rental_user = User.find(rental.tenant_id)
  end

  def ticket_img(ticket)
    if ticket.photo.file.nil?
      return image_path('default-cover.jpg')
    else
      return cl_image_path ticket.photo
    end
  end

  def ticket_classes(ticket)
    classes = ['card-user', 'ticket']

    case ticket.priority
    when 1..3
      classes << 'low'
    when 4..7
      classes << 'mid'
    when 8..10
      classes << 'high'
    end

    classes.join(' ')
  end
end
