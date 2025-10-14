document.addEventListener("DOMContentLoaded", () => {
  const button = document.createElement("button");
  button.textContent = "Click me!";
  button.classList.add("button");

  button.addEventListener("click", () => {
    alert("You clicked the button!");
  });

  document.body.appendChild(button);
});
