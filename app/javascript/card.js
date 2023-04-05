const pay = () => {
  const payjp = Payjp('pk_test_499074e0afdb2073c10c23a8')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');


  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);