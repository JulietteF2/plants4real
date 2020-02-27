const fetch_position = () => {
  navigator.geolocation.getCurrentPosition((data) => {
    [data.coords.latitude, data.coords.longitude];
    console.log([data.coords.latitude, data.coords.longitude])
  });
};

export { fetch_position };
