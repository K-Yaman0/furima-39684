function profitCalculation(){
  const priceInput = document.getElementById("item-price");
  const calcSalesCommission = document.getElementById("add-tax-price");
  const calcProfit = document.getElementById("profit");

  priceInput.addEventListener('input', function(){
    calcSalesCommission.innerHTML = Math.round(priceInput.value * 0.1);
    calcProfit.innerHTML = Math.round(priceInput.value -  Math.round(priceInput.value * 0.1));
  });

}

window.addEventListener('load', profitCalculation)