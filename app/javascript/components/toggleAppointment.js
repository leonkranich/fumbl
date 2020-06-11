const toggleActiveClass = (event) => {
  console.log(event);
  event.target.classList.toggle('active');
};
const toggleActiveOnClick = (btn) => {
  btn.addEventListener('click', toggleActiveClass);
};

const toggleAppointment = () => {
  const availbility = document.querySelector(".form-wrapper")
  const realAvailabilities = JSON.parse(availbility.dataset.availabilities)
  const ava = realAvailabilities.map(e => e.day)
  const btns = document.querySelectorAll(".btn-appointment");

  btns.forEach(toggleActiveOnClick);
};

export { toggleAppointment };
