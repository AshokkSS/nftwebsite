var toggleSwitch = document.querySelector('.switch input[type="checkbox"]');
console.log(localStorage.getItem("lightMode"));
if (localStorage.getItem("lightMode") == "enabled") {
  theme.setAttribute("href", "styles/light.css");
  toggleSwitch.checked = true;
}

function toggleTheme() {
  var theme = document.getElementById("theme");
  if (theme.getAttribute("href") == "styles/styles.css") {
    theme.setAttribute("href", "styles/light.css");
    localStorage.setItem("lightMode", "enabled");
    console.log(localStorage.getItem("lightMode"));
  } else {
    theme.setAttribute("href", "styles/styles.css");
    localStorage.setItem("lightMode", "disabled");
    console.log(localStorage.getItem("lightMode"));
  }
}
