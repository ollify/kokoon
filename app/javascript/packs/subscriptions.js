const clickableAvatars = document.querySelectorAll(".clickable")

clickableAvatars.forEach((avatar) => {
  avatar.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("selected");
  if (event.currentTarget.classList.contains("selected")) {
    event.currentTarget.nextElementSibling.innerHTML =
    `<input class="form-control hidden"
    type="hidden" name="ticket[subscriptions_attributes][${avatar.dataset.subscription}][user_id]"
    value = "${avatar.dataset.user}"
    id="ticket_subscriptions_attributes_0_user_id">`;
    } else {
    event.currentTarget.nextElementSibling.innerHTML =
    `<input class="form-control hidden"
    type="hidden" name="ticket[subscriptions_attributes][${avatar.dataset.subscription}][user_id]"
    id="ticket_subscriptions_attributes_0_user_id">`;
    }
  });
});


// const disabledAvatars = document.querySelectorAll(".unclickable")
// disabledAvatars.forEach((avatar) => {
//   avatar.addEventListener("click", (event) => {
//   console.log(event.currentTarget);

//   event.currentTarget.classList.remove("unclickable");
//   event.currentTarget.classList.add("clickable");
//   });
// });

