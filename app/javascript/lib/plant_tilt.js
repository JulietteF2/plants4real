const tiltPlant = (marker, rotation) => {
    marker.style.transition = "all 0.5s ease"
    let string = marker.style.transform;
    let array = string.split(")");
    let new_string = array[0] + ") " + array[1] + ") " + `rotate(${rotation}deg)`;
    marker.style.transform = new_string;
};

const renderTilt = (collection, array, markers) => {
  collection.forEach((instance) => {
    instance.addEventListener("mouseover", function(event) {
      const instance_index = array.indexOf(event.currentTarget);
      tiltPlant(markers[instance_index], 30);
      setTimeout(function(){ tiltPlant(markers[instance_index], -30);}, 200);
      setTimeout(function(){ tiltPlant(markers[instance_index], 0);}, 400);
      setTimeout(function(){ tiltPlant(markers[instance_index], -30);}, 600);
      setTimeout(function(){ tiltPlant(markers[instance_index], 0);}, 800);
    });
  });
}

const plantHover = function () {
  const cards = document.querySelectorAll(".index-card");
  const cards_array = Array.prototype.slice.call(cards);

  const markers = document.querySelectorAll(".marker");
  const markers_array = Array.prototype.slice.call(markers);

  renderTilt(cards, cards_array, markers);
  renderTilt(markers, markers_array, markers);
}

export { plantHover }
