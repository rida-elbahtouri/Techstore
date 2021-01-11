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
  closeFormBtn.onclick = () => { renderForm.style.display = 'none'; };
  form.appendChild(closeFormBtn);

  const name = document.createElement('p');
  name.className = 'name ';
  name.innerHTML = data.name;
  form.appendChild(name);
  const price = document.createElement('p');
  price.className = 'price ';
  price.innerHTML = data.price;
  form.appendChild(price);

  const add = document.createElement('form');
  add.method = method;
  add.action = action;
  form.appendChild(add);

  const quantity = document.createElement('input');
  quantity.className = 'quantity ';
  quantity.type = 'number';
  quantity.name = 'basket[quantity]';
  quantity.value = 1;
  add.appendChild(quantity);

  const productId = document.createElement('input');
  productId.type = 'hidden';
  productId.name = 'basket[product_id]';
  productId.value = id;
  add.appendChild(productId);

  const btn = document.createElement('input');
  btn.className = 'btn ';
  btn.type = 'submit';
  btn.value = 'Add To Card';
  add.appendChild(btn);
};
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
