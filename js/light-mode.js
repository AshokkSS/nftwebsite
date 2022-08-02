function myFunction2() {
    var body = document.body;
    var textinfo = document.querySelector(".textinfo");
    var navbar = document.querySelector(".navbar");
    var mininavbar = document.querySelector(".mininavbar");
    var ep = document.querySelector(".episode__number");
    var ep2 = document.querySelector(".episode__content");
    var logo = document.querySelector(".logo");
    var navlinks = document.querySelector(".nav-links");
    navbar.classList.toggle("dark-mode-navbar");
    mininavbar.classList.toggle("dark-mode-mininavbar");
    body.classList.toggle("dark-mode");
    textinfo.classList.toggle("dark-mode");
    ep.classList.toggle("dark-mode");
    ep2.classList.toggle("dark-mode");
    logo.classList.toggle("logo-light");
    navlinks.classList.toggle("nav-links-light");}