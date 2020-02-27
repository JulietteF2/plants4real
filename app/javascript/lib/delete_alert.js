const delete_alert = () => {

  const delete_btns = document.querySelectorAll('.delete');

  delete_btns.forEach( (btn) => {
    btn.addEventListener("click", (event) => {
      event.preventDefault();
      const path = btn["href"];
      if (window.confirm("Are you sure you want to delete?")) {
        window.location = path;
      } else {
        event.stopPropagation();
      }
    });
  });
};

export { delete_alert };
