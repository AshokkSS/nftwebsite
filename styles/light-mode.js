function myFunction2() {
    var body = document.body;
    const textinfo = document.querySelector(".textinfo");
    const navbar = document.querySelector(".navbar");
    const mininavbar = document.querySelector(".mininavbar");
    const ep = document.querySelector(".episode__number");
    const ep2 = document.querySelector(".episode__content");
    const logo = document.querySelector(".logo");
    const navlinks = document.querySelector(".nav-links");
    navbar.classList.toggle("dark-mode-navbar");
    mininavbar.classList.toggle("dark-mode-mininavbar");
    body.classList.toggle("dark-mode");
    textinfo.classList.toggle("dark-mode");
    ep.classList.toggle("dark-mode");
    ep2.classList.toggle("dark-mode");
    logo.classList.toggle("logo-light");
    navlinks.classList.toggle("nav-links-light");
 }