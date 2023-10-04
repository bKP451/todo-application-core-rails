document.addEventListener("DOMContentLoaded", function () {
  const editButton = document.querySelector(".edit-button");
  const readOnlyView = document.querySelector(".read-only");
  const editView = document.querySelector(".edit");

  editButton.addEventListener("click", function () {
    readOnlyView.style.display = "none";
    editView.style.display = "block";
    // alert("Edit icon is clicked !!");
  });
  });