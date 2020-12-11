const ratebtn = document.getElementById("rate_product")
const FormRating = document.getElementById("RatingForm")


const CreateRatingForm = () =>{
    const form = document.createElement("div")
    form.className="rateForm"
    FormRating.appendChild(form)
}

CreateRatingForm()
ratebtn.addEventListener("click",()=>{
    console.log("hi")
})