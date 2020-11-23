function tax() {
  const itemPrice = document.getElementById("item-price");
  
  itemPrice.addEventListener("keyup", () => {
    const itemTax = itemPrice.value;
    const taxRate = 0.1;
    const taxPrice = itemTax * taxRate;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = `${ taxPrice.toFixed() }`;
    profit.innerHTML = `${ (itemTax - taxPrice).toFixed() }`;
  } );
};

window.addEventListener("load", tax);