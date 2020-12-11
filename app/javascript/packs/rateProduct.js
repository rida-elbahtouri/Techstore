const ratebtn = document.getElementById("rate_product")
const FormRating = document.getElementById("RatingForm")


const CreateRatingForm = () =>{
    const form = document.createElement("div")
    form.className="rateForm"
    FormRating.appendChild(form)

    const title =  document.createElement("h1")
    title.className="RateForm_title"
    title.innerHTML = "Rate Product"
    form.appendChild(title)

    const helpmsg =  document.createElement("h1")
    helpmsg.className="RateForm_helpmsg"
    helpmsg.innerHTML = "Please give a honest review of the Prduct from 1 To 5"
    form.appendChild(helpmsg)

    const star1 =  document.createElement("i")
    star1.className="fas fa-star ratingStars"
    form.appendChild(star1)

    const star2 =  document.createElement("i")
    star2.className="fas fa-star ratingStars"
    form.appendChild(star2)

    const star3 =  document.createElement("i")
    star3.className="fas fa-star ratingStars"
    form.appendChild(star3)

    const star4 =  document.createElement("i")
    star4.className="fas fa-star ratingStars"
    form.appendChild(star4)

    const star5 =  document.createElement("i")
    star5.className="fas fa-star ratingStars"
    form.appendChild(star5)

}

CreateRatingForm()
ratebtn.addEventListener("click",()=>{
    console.log("hi")
})