const toggleTimeslots = () => {
  document.querySelector('.datepicker.form-control').classList.add("display-none");
  const FlatpickerDate = document.querySelector('.flatpickr-input');
  if (FlatpickerDate) {
    const selectedTimeslotDates =  document.getElementById('selected-timeslot-dates');
    const BookingData = document.getElementById('booking-data').innerText;
    const BookingJSON = JSON.parse(BookingData);
    FlatpickerDate.addEventListener("change", (event) => {

      // console.log(event);
      // console.log(event.currentTarget);
      selectedTimeslotDates.innerHTML = "";
      let AvailDate = event.currentTarget.value;
      let timeslots = BookingJSON.availabilities[AvailDate].timeslots;
      // debugger;
      timeslots.forEach((div) => {
        selectedTimeslotDates.insertAdjacentHTML('beforeend', div);
      });
      let timeslotSections = document.querySelectorAll('.timeslot-selection');
      timeslotSections.forEach((element) => {
        element.addEventListener('click', (event) => {
          let TimeslotID = event.currentTarget.dataset.timeslotId;
          let BookingForm = document.querySelector('.booking-form').children[1];
          // debugger;
          let formElement = `<div class="checkbox_items">
          <input name="timeslots[${TimeslotID}]" type="hidden" value="1">
          <p>${event.currentTarget.innerText}</p>
          </div>`
          BookingForm.insertAdjacentHTML('afterbegin', formElement);
        });
      })


      // debugger;
    });




    // debugger;
  };

  };

export { toggleTimeslots };
