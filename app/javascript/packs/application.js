import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpickr } from '../plugins/init_flatpickr';

if (document.getElementById('flat_address')) {
  initAutocomplete();
}

const closeOnClick = () => {
  const invitation = document.querySelector('.invitation')
  const closeCross = document.querySelector('#close-cross')
  closeCross.addEventListener('click', (event) => {
    invitation.classList.toggle('hidden')
  })
}

const flatsShow = document.querySelector(".flats.show");
const myAccount = document.querySelector(".pages.my_account");
if(flatsShow || myAccount) {
  closeOnClick();
}


