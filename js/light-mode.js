function myFunction2() {
    var body = document.body;
    var navbar = document.querySelector(".navbar");
    var mininavbar = document.querySelector(".mininavbar");
    var logo = document.querySelector(".logo");
    var navlinks = document.querySelector(".nav-links");
    var h2 = document.querySelector("h2")
    navbar.classList.toggle("dark-mode-navbar");
    mininavbar.classList.toggle("dark-mode-mininavbar");
    body.classList.toggle("dark-mode"); 
    logo.classList.toggle("logo-light");
    navlinks.classList.toggle("nav-links-light");}