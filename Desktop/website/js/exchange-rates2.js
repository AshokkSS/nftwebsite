function getExchangeRates(event, baseCurrency = "SOL") {
  var requestOptions = {
    method: "GET",
    redirect: "follow",
  };

  // call the api
  fetch(
    `http://api.coinbase.com/v2/exchange-rates?currency=${baseCurrency}`,
    requestOptions
  )
    .then((response) => response.json())
    .then((result) => {
      // render cards
      renderCards(result.data.rates, baseCurrency);
    })
    .catch((error) => console.log("error", error));
}

function renderCards(rates, baseCurrency) {
  // Get the usd card
  var num = rates["USD"];
  document.getElementById(
    "usd"
  ).innerHTML = `1 ${baseCurrency} \t=\t &#36 ${rates["USD"]}`;

  // Get the inr card
  document.getElementById(
    "gbp"
  ).innerHTML = `1 ${baseCurrency} \t=\t &#163 ${rates["GBP"]}`;
}
