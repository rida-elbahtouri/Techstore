const sts = document.getElementById("product-stars")

const rating = (num)=> {
    const stars = document.querySelectorAll(`.star${num}`)

    stars.forEach(star=>{
        star.style.color = "red"
    })
}

rating(parseInt(sts.value, 10))