const exchange_rate_usd = 23255;

const convertMoneyToUSD = (moneyVND) => {
  return moneyVND / exchange_rate_usd;
}

export {
    convertMoneyToUSD
}