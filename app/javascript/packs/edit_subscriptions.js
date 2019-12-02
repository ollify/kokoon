const clickableAvatars = document.querySelectorAll(".clickable")

clickableAvatars.forEach((avatar) => {
  avatar.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("selected");
  if (event.currentTarget.classList.contains("subscriber")) {
    event.currentTarget.previousElementSibling.innerHTML =
    `<input class="form-control hidden"
    type="hidden" name="ticket[subscriptions_attributes][${avatar.dataset.subscription}][id]"
    value = "${avatar.dataset.subscription}"
    id="ticket_subscriptions_attributes_0_user_id">`;
    event.currentTarget.nextElementSibling.innerHTML =
    `<input class="form-control hidden"
    type="hidden" name="ticket[subscriptions_attributes][${avatar.dataset.subscription}][_destroy]"
    value = "1"
    id="ticket_subscriptions_attributes_0_user_id">`;
  } else {
    event.currentTarget.previousElementSibling.innerHTML =
    `<input class="form-control hidden"
    type="hidden" name="ticket[subscriptions_attributes][${avatar.dataset.subscription}][user_id]"
    value = "${avatar.dataset.user}"
    id="ticket_subscriptions_attributes_0_user_id">`;
  }})
});


const avatars = document.querySelectorAll(".avatar-large");

avatars.forEach((avatar) => {
  avatar.addEventListener("click", (event) => {
    if (!event.currentTarget.classList.contains("clickable")) {
      document.querySelector("body").insertAdjacentHTML('afterbegin',
        `<div class="alert alert-info alert-dismissible fade show" role="alert">
          No worries guacamole, you are automatically subscribed to your own ticket.
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>`
        );
    };
  });
});
