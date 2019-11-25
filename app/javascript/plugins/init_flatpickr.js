import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const dateField = document.getElementById("user_birthdate");
  flatpickr(dateField, {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    maxDate: "today"
  });
}

export { initFlatpickr };
