const fetch_position = () => {

  const trigger_button = document.getElementById("geoform");
  const submit_btn = document.getElementById("geosubmit");

  if (trigger_button) {
    trigger_button.addEventListener("click", (event) => {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition((data) => {
        const hidden_tag = document.getElementById("current_location");
        hidden_tag.value = `${[data.coords.latitude, data.coords.longitude]}`;
        // console.log([data.coords.latitude, data.coords.longitude])
        submit_btn.click();
      });
    })
  }
};

export { fetch_position };
