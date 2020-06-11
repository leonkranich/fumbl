import flatpickr from "flatpickr";

const available = () => {
  const availbility = document.querySelector(".form-wrapper")
  const realAvailabilities = JSON.parse(availbility.dataset.availabilities)
  const ava = realAvailabilities.map(e => e.day)
  flatpickr(".datepicker", {
    inline: true,
    dateFormat: "Y-m-d",
    defaultDate: ava,

  });
};

export default available;

