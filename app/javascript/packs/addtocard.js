const addtocard = document.querySelectorAll('.addtocard');
const renderForm = document.getElementById('renderForm');
const closeBtn = document.querySelectorAll('.close-btn');
const RatingForm = document.getElementById('RatingForm');

const CreateAdToCardForm = (data, id, method, action) => {
  const form = document.createElement('div');
  form.className = 'addform';
  renderForm.appendChild(form);

  const closeFormBtn = document.createElement('button');
  closeFormBtn.className = 'close-btn';
  closeFormBtn.innerHTML = 'X';
  closeFormBtn.onclick = () => { renderForm.style.display = 'none';
  form.parentNode.removeChild(form) };
  form.appendChild(closeFormBtn);

 const photo = document.createElement('img');
  photo.className = 'photo';
  photo.setAttribute('src',data.photo);
  form.appendChild(photo);
  
  const twoflex = document.createElement('div')
  twoflex.className = "flex-two"
  form.appendChild(twoflex)

  const name = document.createElement('p');
  name.className = 'name ';
  name.innerHTML = data.name;
  twoflex.appendChild(name);


  const price = document.createElement('p');
  price.className = 'price ';
  price.innerHTML = `${data.price} $`;
  twoflex.appendChild(price);

  const add = document.createElement('form');
  add.method = method;
  add.action = action;
  form.appendChild(add);

  const quantityform = document.createElement('div')
  quantityform.className = "quantityform"
  add.appendChild(quantityform)


  const upbtn = document.createElement('button')
  upbtn.type="button"
  upbtn.className = "quantitybtns"
  upbtn.onclick = () => { incquantity()}
  quantityform.appendChild(upbtn)

  const arrup = document.createElement("i")
  arrup.className="fas fa-arrow-up"
  upbtn.appendChild(arrup)

  const quantity = document.createElement('input');
  quantity.className = 'quantity';
  quantity.id="quantity_id";
  quantity.type = 'number';
  quantity.name = 'basket[quantity]';
  quantity.value = 1;
  quantityform.appendChild(quantity);

  const downbtn = document.createElement('button')
  downbtn.type="button"
  downbtn.id="downbtn_id"
  downbtn.className = "quantitybtns"
  downbtn.onclick = () => { decquantity()}
  quantityform.appendChild(downbtn)

  const arrdown = document.createElement("i")
  arrdown.className="fas fa-arrow-down"
  downbtn.appendChild(arrdown)

  const productId = document.createElement('input');
  productId.type = 'hidden';
  productId.name = 'basket[product_id]';
  productId.value = id;
  add.appendChild(productId);

  const btn = document.createElement('input');
  btn.className = 'bluebutton';
  btn.type = 'submit';
  btn.value = 'Add To Card';
  add.appendChild(btn);
};

const incquantity =()=>{
  e = document.getElementById("quantity_id")
  e.value = parseInt(e.value,10) + 1
  disablebtn(e.value)
}
const decquantity=()=>{
  e = document.getElementById("quantity_id")
  if(e.value === "1"){
    downbtn_id.style.backgroundColor ="#f138635d" ;
  }else {
     e.value = parseInt(e.value,10) - 1
     disablebtn(e.value)
  }
}
const disablebtn=(v)=>{
  if(v === "1"){
    downbtn_id.style.backgroundColor ="#f138635d" ;
  }else {
    downbtn_id.style.backgroundColor ="#f13864" ;
  }
}
closeBtn.forEach(btn => {
  btn.addEventListener('click', () => {
    
    if (RatingForm) {
      RatingForm.style.display = 'none';
    }
  });
});
addtocard.forEach(btn => {
  btn.addEventListener('click', () => {
    renderForm.style.display = 'block';
    fetch(`/productscard/${btn.value}`)
      .then((data) => data.json())
      .then((data) => {
        CreateAdToCardForm(data, btn.value, 'post', '/baskets');
      });
  });
});
