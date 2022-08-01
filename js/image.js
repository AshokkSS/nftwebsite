let image = document.getElementById("image");
let images = ["images/img1.jpeg", "images/img2.jpeg", "images/img3.jpeg", "images/img4.jpeg"];
setInterval(function () {
  let random = Math.floor(Math.random() * 4);
  image.src = images[random];
  console.log(image.src);
}, 1000);
