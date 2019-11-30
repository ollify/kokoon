
const disabledAvatars = document.querySelectorAll(".unclickable")
disabledAvatars.forEach((avatar) => {
  avatar.addEventListener("click", (event) => {
  console.log(event.currentTarget);
  event.currentTarget.nextElementSibling.innerHTML = `123`;
  event.currentTarget.classList.remove("unclickable");
  event.currentTarget.classList.add("clickable");
  });
});


const clickableAvatars = document.querySelectorAll(".clickable")

clickableAvatars.forEach((avatar) => {
  avatar.addEventListener("click", (event) => {
  // console.log(event.currentTarget.nextElementSibling.innerHTML)
  event.currentTarget.nextElementSibling.innerHTML = `<input class="form-control hidden"
  type="hidden" name="ticket[subscriptions_attributes][${avatar.dataset.subscription}][user_id]"
  value = "${avatar.dataset.user}"
  id="ticket_subscriptions_attributes_0_user_id">`;
  event.currentTarget.classList.remove("clickable");
  event.currentTarget.classList.add("unclickable");
  });
});
