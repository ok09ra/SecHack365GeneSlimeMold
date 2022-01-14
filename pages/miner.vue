<template>
  <div>
    <Header />
    
    <form>
      <label>
        解析対象のGeneHolderのアドレス
        <input type="text" name="gene_holder_address">
      </label>
      <label>
        解析結果のリンク
        <input type="url" name="gene_url">
      </label>
      <label>
        説明
        <input type="text" name="description">
      </label>
      <button id="btn">送信</button>
    </form>
  </div>
</template>

<script>
  var btn = document.getElementById("btn");

  btn.addEventListener("click", function() {

  })

</script>
