document.addEventListener(
  "turbolinks:load", (e) => {
    Payjp.setPublicKey("pk_test_7cc71c15790e0cce7327840d");
    const btn = document.getElementById('token_submit'); 
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      
      const card = {
        number: document.getElementById("card_id").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      };

      Payjp.createToken(card, (status, response) => {
        if (status === 200) { 
          $("#card_id").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#card_token").append(
            $(`<input type="hidden" name="payjp-token">`).val(response.id)
          ); 
          document.inputForm.submit();
          alert("登録が完了しました"); 
        } else {
          alert("カード情報が正しくありません。"); 
        }
      });
    });
  },false);