const renderForm = document.getElementById('renderForm');
const editCard = document.querySelectorAll('.editcard');
const cardtotal = document.getElementById('cardtotal');

const CreateAdToCardForm = (data, id, basketID) => {
  const form = document.createElement('div');
  form.className = 'addform';
  form.id = 'editbasketcontent';
  renderForm.appendChild(form);
  const closeFormBtn = document.createElement('button');
  closeFormBtn.className = 'close-btn';
  closeFormBtn.innerHTML = 'X';
  closeFormBtn.onclick = () => {
    renderForm.style.display = 'none';
    form.parentNode.removeChild(form);
  };
  form.appendChild(closeFormBtn);

  const photo = document.createElement('img');
  photo.className = 'photo';
  photo.setAttribute('src', data.photo);
  form.appendChild(photo);

  const twoflex = document.createElement('div');
  twoflex.className = 'flex-two';
  form.appendChild(twoflex);

  const name = document.createElement('p');
  name.className = 'name ';
  name.innerHTML = data.name;
  twoflex.appendChild(name);

  const price = document.createElement('p');
  price.className = 'price ';
  price.innerHTML = `${data.price} $`;
  twoflex.appendChild(price);

  const edit = document.createElement('form');
  form.appendChild(edit);
  const qunt = document.getElementById(basketID);
  const total = document.getElementById(`totalfor${basketID}`);

  const quantityform = document.createElement('div');
  quantityform.className = 'quantityform';
  edit.appendChild(quantityform);

  const upbtn = document.createElement('button');
  upbtn.type = 'button';
  upbtn.className = 'quantitybtns';
  upbtn.onclick = () => { incquantity(); };
  quantityform.appendChild(upbtn);

  const arrup = document.createElement('i');
  arrup.className = 'fas fa-arrow-up';
  upbtn.appendChild(arrup);

  const quantity = document.createElement('input');
  quantity.className = 'quantity';
  quantity.id = 'quantity_id';
  quantity.type = 'number';
  quantity.name = 'basket[quantity]';
  quantity.value = parseInt(qunt.innerHTML, 10);
  quantityform.appendChild(quantity);

  const downbtn = document.createElement('button');
  downbtn.type = 'button';
  downbtn.id = 'downbtn_id';
  downbtn.className = 'quantitybtns downquantitybtn';
  downbtn.onclick = () => { decquantity(); };
  quantityform.appendChild(downbtn);

  const arrdown = document.createElement('i');
  arrdown.className = 'fas fa-arrow-down';
  downbtn.appendChild(arrdown);

  const productId = document.createElement('input');
  productId.type = 'hidden';
  productId.name = 'basket[product_id]';
  productId.value = id;
  edit.appendChild(productId);

  const btn = document.createElement('input');
  btn.className = 'bluebutton';
  btn.type = 'submit';
  btn.value = 'edit To Card';
  // eslint-disable-next-line
  btn.onclick = (e) => updatebasket(e,
    quantity.value, id, basketID, qunt, total, data.price, data.promotion);
  edit.appendChild(btn);
};

const incquantity = () => {
  e = document.getElementById('quantity_id');
  e.value = parseInt(e.value, 10) + 1;
  disablebtn(e.value);
};
const decquantity = () => {
  e = document.getElementById('quantity_id');
  if (e.value === '1') {
    downbtn_id.style.backgroundColor = '#f138635d';
  } else {
    e.value = parseInt(e.value, 10) - 1;
    disablebtn(e.value);
  }
};
const disablebtn = (v) => {
  if (v === '1') {
    downbtn_id.style.backgroundColor = '#f138635d';
  } else {
    downbtn_id.style.backgroundColor = '#f13864';
  }
};

editCard.forEach(btn => {
  btn.addEventListener('click', () => {
    const basketID = btn.value.split('/')[0];
    const ProductId = btn.value.split('/')[1];
    renderForm.style.display = 'block';
    fetch(`/productscard/${ProductId}`)
      .then((data) => data.json())
      .then((data) => {
        CreateAdToCardForm(data, ProductId, basketID);
      });
  });
});

const updatebasket = (e, qunt, productId, BasketId, quntel, total, price, promo) => {
  e.preventDefault();
  fetch(`/baskets/${parseInt(BasketId, 10)}`,
    {
      method: 'PATCH',
      body: JSON.stringify({
        id: parseInt(BasketId, 10),
        product_id: parseInt(productId, 10),
        quantity: parseInt(qunt, 10),
      }),
      headers: { 'Content-type': 'application/json; charset=UTF-8' },
    })
    .then(renderForm.style.display = 'none',
    // eslint-disable-next-line
      renderForm.innerHTML=null,
      cardtotal.innerHTML = parseInt(cardtotal.innerHTML, 10) + parseInt((qunt * (price - (price * promo) / 100)) - (quntel.innerHTML * (price - (price * promo) / 100)), 10),
      quntel.innerHTML = qunt,
      total.innerHTML = qunt * (price - (price * promo) / 100));
};