document.addEventListener("DOMContentLoaded", function () {
  const editButton = document.querySelector(".edit-button");
  const readOnlyView = document.querySelector(".read-only");
  const editView = document.querySelector(".edit");
  const projectTitle = document.querySelector(".project-description-section-heading .project-title")
  const projectTitleForm = document.getElementById('project-title-form')
  const projectTitleDescriptionInput = document.querySelector('#project-title-form .project-name-description-edit-input');


  editButton.addEventListener("click", function () {
    readOnlyView.style.display = "none";
    editView.style.display = "block";
  });

  projectTitle.addEventListener("click", function(){
    // console.log('I am now editable');
    projectTitleForm.style.display = "block";
    projectTitle.style.display = "none";
  })

  projectTitleDescriptionInput.addEventListener("blur", function(){
    console.log("I am focused out");
    projectTitleForm.submit();
  })





  });