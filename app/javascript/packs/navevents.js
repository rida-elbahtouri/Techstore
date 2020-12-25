
    const categorybtn = document.getElementById('category-nav');
    const categorylist = document.getElementById('category-list');
    const humberger = document.getElementById("humberger")
    const nav = document.getElementById("navbar-content")


    function WindowSize(){
        
        let w = document.documentElement.clientWidth;
        if (w > 850){
            nav.style.display = "flex"
        }else{
            nav.style.display = 'none'
        }
    }
        
    // Attaching the event listener function to window's resize event
    window.addEventListener("resize", WindowSize)
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


