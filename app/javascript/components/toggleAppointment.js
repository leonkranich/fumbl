const toggleActiveClass = (event) => {
  console.log(event);
  event.target.classList.toggle('active');
};
const toggleActiveOnClick = (btn) => {
  btn.addEventListener('click', toggleActiveClass);
};

const toggleAppointment = () => {
  const btns = document.querySelectorAll(".btn-appointment");

  btns.forEach(toggleActiveOnClick);
};

export { toggleAppointment };
