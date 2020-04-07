$(function(){
$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

//動的カテゴリボックスの実装

$('#parent-form').on('change', function(){
  let parentValue = document.getElementById("parent-form").value;
  if (parentValue != "選択してください"){
  $.ajax({
    url: '/products/search',
    type: "GET",
    data: {
      parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
    },
    dataType: 'json'
    //json形式を指定
    
  })
  .done(function(data){
    $('#child-form').remove();
    $('#grandchild-form').remove();
    function childrenselect(data) {
    
    let opt1 = data.map(x=> `<option value="${x.id}">${x.name}</option>`)
      let opt = opt1.join('');
      console.log(opt);
      let tako = `<option value="">選択してください</option>
      ${opt}`;
      let h = `<select name="" id="child-form" selected>${tako} </select>`; //colection_selectのとこ
      return h
    }
    var html = childrenselect(data);
    $('#formId').append(html);
  })
  .fail(function() {
    alert('error');
  }); 
}else{
  $('#child-form').remove();
  $('#grandchild-form').remove();
}
});




$(document).on('change','#child-form', function(){
  let parentValue = document.getElementById("child-form").value;
  if(parentValue != "選択してください"){
  $.ajax({
    url: '/products/search',
    type: "GET",
    data: {
      parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
    },
    dataType: 'json'
    //json形式を指定
  })
  .done(function(data){
    if (data.length !=0){
      $('#grandchild-form').remove();
      
      function childrenselect(data) {
        
        let opt1 = data.map(x=> `<option value="${x.id}">${x.name}</option>`)
        let opt = opt1.join('');
        console.log(opt);
        let tako = `<option value="">選択してください</option>
        ${opt}`;
        let h = `<select name="product[category_id]" id="grandchild-form" selected>${tako} </select>`; //colection_selectのとこ
        return h
      }
      var html = childrenselect(data);
      $('#formId').append(html);
    }
    })
    .fail(function() {
      alert('error');
    })
  }else{
    $('#grandchild-form').remove();
  }
});

})


