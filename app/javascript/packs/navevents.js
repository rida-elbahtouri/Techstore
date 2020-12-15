
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
        if (nav.style.display === "flex"){
            nav.style.display = 'none';
        }else {
            nav.style.display = 'flex';
        }
    })


