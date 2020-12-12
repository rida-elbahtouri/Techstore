const ratebtn = document.getElementById("rate_product")
const FormRating = document.getElementById("RatingForm")


ratebtn.addEventListener("click",()=>{
    FormRating.style.display="block"
   let stars = document.querySelectorAll(".ratingStars")

   let selected = 'ratingsubmmitvalue'
    stars.forEach(btn=>{
        btn.addEventListener('click',()=>{
            
            let starSelected = parseInt(btn.id.slice(-1),10)
            for(let i = 1; i <= 5;i++){
                document.getElementById(`ratestar${i}`).style.color = "black"
            }
            for(let i = 1; i <= starSelected;i++){
                document.getElementById(`ratestar${i}`).style.color = "red"
            }

            const starvalue = document.querySelector(`[value=${selected}]`);
            starvalue.value = `starselected${starSelected}`
            selected = `starselected${starSelected}`
    
        })
    })
   
  
   
})

ratebtn.addEventListener("click",()=>{
    console.log("hi")
})