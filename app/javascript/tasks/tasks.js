document.addEventListener("turbolinks:load", function () {
  const editButton = document.querySelector(".edit-button");
  const readOnlyView = document.querySelector(".read-only");
  const editView = document.querySelector(".edit");
  const projectTitle = document.querySelector(".project-description-section-heading .project-title h1")
  const projectTitleForm = document.getElementById('project-title-form')
  const projectTitleEditInput = document.querySelector('#project-name-description-section-edit-input');
  const newProjectInput = document.getElementById('new-project-input');
  const newProjectInputForm = document.getElementById('new-project-input-form')
  const projectOptionsEllipse = document.querySelector('.project-description-section-heading .project-title span')
  const projectModal = document.getElementById('project-modal');
  const deleteButtonOfModal = document.getElementById('project-delete-button');
  
  editButton && editButton.addEventListener("click", function () {
    readOnlyView.style.display = "none";
    editView.style.display = "block";
  });

  projectTitle.addEventListener("click", function(){
    projectTitleForm.style.display = "block";
    projectTitle.style.display = "none";
  })

  projectTitleEditInput.addEventListener("blur", function(){
    projectTitleForm.submit();
  })

  newProjectInput.addEventListener("blur", function(){
    newProjectInputForm.submit();
  })

  projectOptionsEllipse.addEventListener("click", function(){
    projectModal.style.display = projectModal.style.display === 'block' ? 'none' : 'block' ;
  })
  
});
