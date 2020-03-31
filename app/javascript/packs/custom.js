require('./bling.js')

document.addEventListener("turbolinks:load", function() {
  console.log('dogo');
  let errors = $$('.field_with_errors');
  

  if (errors.length != 0) {
    errors.forEach(error => {
      error.classList.add('animated', 'shake');
    });
  }

  let mainImage = $('.article-show > img');

  if (mainImage != null){
    console.log('I entered');
    
    new simpleParallax(mainImage);
  }else{
    console.log('no image');
  }
})