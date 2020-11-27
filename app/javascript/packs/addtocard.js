const addtocard = document.querySelectorAll(".addtocard")
const renderForm = document.getElementById("renderForm")
const editCard = document.querySelectorAll(".editcard")

const CreateAdToCardForm = (data,id,method,action) =>{
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
    
    const add = document.createElement('form');
    add.method=method
    add.action = action
    form.appendChild(add);

    const quantity = document.createElement('input');
    quantity.className = 'quantity ';
    quantity.type="number"
    quantity.name="basket[quantity]"
    quantity.value = 1;
    add.appendChild(quantity);

    const product_id =document.createElement('input');
    product_id.type='hidden'
    product_id.name="basket[product_id]"
    product_id.value=id
    add.appendChild(product_id)

    const btn = document.createElement('input');
    btn.className = 'btn ';
    btn.type="submit"
    btn.value = "Add To Card";
    add.appendChild(btn);
}
addtocard.forEach(btn=>{
    btn.addEventListener('click',(e)=>{
        renderForm.style.display="block"
        fetch(`/productscard/${btn.value}`)
        .then((data) => data.json())
        .then((data) => {
            CreateAdToCardForm(data,btn.value,"post","/baskets")
        });
})
})
