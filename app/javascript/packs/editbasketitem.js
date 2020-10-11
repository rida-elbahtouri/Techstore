const addtocard = document.querySelectorAll(".addtocard")
const renderForm = document.getElementById("renderForm")
const editCard = document.querySelectorAll(".editcard")

const CreateAdToCardForm = (data,id,basketID) =>{
    const form = document.createElement("div")
    form.className="addform"
    renderForm.appendChild(form)
    const name = document.createElement('p');
    name.className = 'name ';
    name.innerHTML = data.name;
    form.appendChild(name);
    const price = document.createElement('p');
    price.className = 'price ';
    price.innerHTML = data.price;
    form.appendChild(price);
    
    const edit = document.createElement('form');
    form.appendChild(edit);

    const quantity = document.createElement('input');
    quantity.className = 'quantity ';
    quantity.type="number"
    // quantity.name="basket[quantity]"
    quantity.value = 1;
    edit.appendChild(quantity);

    const product_id =document.createElement('input');
    product_id.type='hidden'
    // product_id.name="basket[product_id]"
    product_id.value=id
    edit.appendChild(product_id)
    const qunt = document.getElementById(basketID)
    const btn = document.createElement('input');
    btn.className = 'btn';
    btn.type="submit"
    btn.value = "edit To Card";
    btn.onclick=(e)=>updatebasket(e,quantity.value,id,basketID)
    edit.appendChild(btn);
}
editCard.forEach(btn=>{
    btn.addEventListener('click',(e)=>{ 
        const basketID= e.target.value.split("/")[0]
        const ProductId= e.target.value.split("/")[1]
        renderForm.style.display="block"
         fetch(`/productscard/${ProductId}`)
         .then((data) => data.json())
         .then((data) => {
             CreateAdToCardForm(data,ProductId,basketID)
        });
})
})

const updatebasket=(e,qunt,productId,BasketId)=>{
    e.preventDefault()
    fetch(`/baskets/${BasketId}`,
    {method: 'PATCH',
    body: JSON.stringify({id:parseInt(BasketId), product_id: parseInt(productId),quantity:parseInt(qunt) }),
    headers: {"Content-type": "application/json; charset=UTF-8"}})
    .then(renderForm.style.display="none")
}
