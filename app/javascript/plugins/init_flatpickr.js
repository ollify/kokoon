import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const birthdateField = document.getElementById("user_birthdate");
  flatpickr(birthdateField, {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    maxDate: "today",
  });

  // const rentalDate = document.getElementById("rental_start_date");
  // flatpickr(rentalDate, {
  //   altInput: true,
  //   altFormat: "F j, Y",
  //   dateFormat: "Y-m-d",
  //   mode: "range"
  // });
}

export { initFlatpickr };
