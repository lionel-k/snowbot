const searchInput = document.querySelectorAll('.search-input');

searchInput.forEach((input) => {
  input.addEventListener("click", () => {
    input.classList.remove('unselected');
  });
});
