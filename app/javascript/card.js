const pay = () => {
  const payjp = Payjp('pk_test_499074e0afdb2073c10c23a8')// PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);