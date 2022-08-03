const toggleSwitch = document.querySelector(
    '.switch input[type="checkbox"]'
);
console.log(localStorage.getItem('lightMode'));
if(localStorage.getItem('lightMode') == 'enabled'){
    theme.setAttribute('href', 'light.css');
    toggleSwitch.checked = true;
}

function toggleTheme() {
    var theme = document.getElementById('theme');
    if (theme.getAttribute('href') == 'styles.css') {

        theme.setAttribute('href', 'light.css');
        localStorage.setItem('lightMode', 'enabled');
        console.log(localStorage.getItem('lightMode'));

    }
    else {

        theme.setAttribute('href', 'styles.css');
        localStorage.setItem('lightMode', 'disabled');
        console.log(localStorage.getItem('lightMode'));

    }

}
;