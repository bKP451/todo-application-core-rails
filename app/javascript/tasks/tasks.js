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
  const editButtonOfModal = document.getElementById('project-edit-button');
  const deleteButtonOfModal = document.getElementById('project-delete-button');
  

  editButton && editButton.addEventListener("click", function () {
    readOnlyView.style.display = "none";
    editView.style.display = "block";
  });

  projectTitle.addEventListener("click", function(){
    projectTitleForm.style.display = "block";
    projectTitle.style.display = "none";
  })

  editButtonOfModal.addEventListener("click", function(){
    projectTitleForm.style.display = "block";
    projectTitle.style.display = "none";
    projectModal.style.display = "none";
  })

  deleteButtonOfModal.addEventListener("click", function(e){
    projectModal.style.display = "none";

    // Show the delete confirmation dialog
    if(confirm("You sure?")){
      // const projectId 
      fetch(`/projects/${projectId}`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-TOKEN': '<%= form_authenticity_token %>',
          'Content-Type': 'application/json'
        }
      })
      .then(response => {
        if(response.ok){
          window.location.href = '/';
        }else
        {console.log("error in deletion")}
      }).catch(error => {
        console.log('Error', error)
      })
    }
  })

  projectTitleEditInput.addEventListener("blur", function(){
    projectTitleForm.submit();
  })

  newProjectInput.addEventListener("blur", function(){
    newProjectInputForm.submit();
  })

  projectOptionsEllipse.addEventListener("click", function(){
    const ellipseRect = projectOptionsEllipse.getBoundingClientRect();
    projectModal.style.top = `${ellipseRect.bottom}px`; // Position below the ⋮ element
    projectModal.style.left = `${ellipseRect.left}px`; // Align with the left edge of the ⋮ element
    projectModal.style.display = projectModal.style.display === 'block' ? 'none' : 'block' ;
  })
  
});
