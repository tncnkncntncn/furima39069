function price(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener('input', function() {
    const price = itemPrice.value;

    const tax = Math.floor(price * 0.1);
    addTaxPrice.textContent = tax;

    const profitValue = price - tax;
    profit.textContent = profitValue;
  });
};
window.addEventListener('load', price);