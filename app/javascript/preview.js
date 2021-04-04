if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('item-image-list');

    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      //id属性を与える
      imageElement.id = 'pic-img'
      
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      // classList.addを用いてclass属性を指定する。
      blobImage.classList.add('img-position');
      blobImage.setAttribute('src',blob);

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){

      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      //8行目で指定したidを持った要素を取得する。(getElementById)
      const imageContent = document.getElementById('pic-img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}