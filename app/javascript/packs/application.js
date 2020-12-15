// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "@fortawesome/fontawesome-free/js/all"; 

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.onload = function(){

const categorybtn = document.getElementById('category-nav');
const categorylist = document.getElementById('category-list');
const humberger = document.getElementById("humberger")
const nav = document.getElementById("navbar-content")

if (window.innerWidth > 850){
document.onclick = (e)=>{
    if(e.target === categorybtn){
        categorylist.style.display = 'block';
    }else {
        categorylist.style.display = 'none';
    }
 }   
};

humberger.addEventListener("click",()=>{
    console.log("event work")
    if (nav.style.display === "flex"){
        nav.style.display = 'none';
    }else {
        nav.style.display = 'flex';
    }
})


};