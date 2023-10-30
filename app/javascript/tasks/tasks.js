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
  const completeTaskCheckbox = document.querySelector('.complete-task-checkbox');  
  const deleteTaskButtons = document.querySelectorAll('.delete-task-button');
  const deleteModal = document.querySelector('.modal');
  const closeButtonOfDeleteModal = document.querySelector('.delete-modal-close-button');
  
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

  // Delete Project functionality of delete options from 
  // modal when opened on ellipse icon.

  deleteButtonOfModal.addEventListener("click", function(e){
    projectModal.style.display = "none";
    console.log(`Delete button of Project modal options clicked.`)
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

  // logic for complete task
  completeTaskCheckbox && completeTaskCheckbox.addEventListener('change', function(){
    const form = this.closest('form');
    const formData = new FormData(form);

    const xhr = new XMLHttpRequest();
    const action = form.getAttribute('action');
    const url = `http://localhost:3000${action}`;
    console.log(`url is ${url}`)
    xhr.open('PATCH', url);

    xhr.onload = function() {
      if (xhr.status === 200){
        const taskItem = form.closest('.single-todo-item');
        const read_only = taskItem.querySelector('.read-only');
        const taskNameLabel = read_only.querySelector('.label');

        console.log(`Successfully toggled the completed status`)

        // if (taskNameLabel){
        //   if(completeTaskCheckbox.checked){
        //     taskNameLabel.style.textDecoration = 'line-through';
        //   } else {
        //     taskNameLabel.style.textDecoration = 'none';
        //   }
        // }
      }else {
        console.log(this.responseText)
      }
    }

    xhr.onerror = function() {
      console.log(`XML Http Request error in toggling completed status`)
    }

    xhr.send(formData);
  })

  function openModal(id){
    const modal = document.getElementById('customModal'+ id);
    modal.style.display = "block";
  }

  function closeModal(id){
  }
  
  deleteTaskButtons.forEach(function(element){
    element.addEventListener('click', function(){
      deleteModal.style.display = "block";
  })
    
    // Logic for close button of Delete Modal
  closeButtonOfDeleteModal.addEventListener('click', function(){
    console.log('close button of Delete modal is clicked.')
    const modal = document.getElementById('customModal' + id);
    modal.style.display ="none";
  })

  })

  



  
})


