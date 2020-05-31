var titleInputField = document.getElementById('post-title-input');
var graphicInputField = document.getElementById('post-graphic-input');
var soundInputField = document.getElementById('post-sound-input');
var descriptionInputField = document.getElementById('post-description-input');
var embedInputField = document.getElementById('post-embed-input');
var tagsInputField = document.getElementById('post-tags-input');


function toggleModal() {

  var modalBackdrop = document.getElementById('modal-backdrop');
  var createModal = document.getElementById('create-modal');

  //Clear text
  titleInputField.value = "";
  graphicInputField.value = "";
  soundInputField.value = "";
  descriptionInputField.value = "";
  embedInputField.value = "";
  tagsInputField.value = "";

  modalBackdrop.classList.toggle('hidden');
  createModal.classList.toggle('hidden');
}

function handleModalAcceptClick() {

  var title = titleInputField.value.trim();
  var graphic = graphicInputField.value.trim();
  var sound = soundInputField.value.trim();
  var description = descriptionInputField.value.trim();
  var embed = embedPostID.value.trim();
  var tags = tagsInputField.value.trim();

  if (!title || !graphic || !sound) {
    alert("You must provide a title, graphic, and sound");
  } else {

    toggleModal();

  }
}

var createButton = document.getElementById('create-post-button');
var modalClose = document.getElementById('modal-close');
var modalCancel = document.getElementById('modal-cancel');
var modalAccept = document.getElementById('modal-accept');
createButton.addEventListener('click', toggleModal);
modalClose.addEventListener('click', toggleModal);
modalCancel.addEventListener('click', toggleModal);
modalAccept.addEventListener('click', handleModalAcceptClick);
