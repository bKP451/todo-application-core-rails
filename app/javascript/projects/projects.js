document.addEventListener("turbolinks:load", function () {
  const projectDeleteModal = document.querySelector(".project-delete-modal");
  const projectPopupDeleteButton = document.getElementById('project-delete-button');
  
  projectPopupDeleteButton.addEventListener("click", function(){
    projectDeleteModal.style.display = "block";
  })
})