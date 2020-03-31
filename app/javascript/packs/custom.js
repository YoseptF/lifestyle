require('./bling.js')

document.addEventListener('turbolinks:load', function () {
  let errors = $$('.field_with_errors');


  if (errors.length != 0) {
    errors.forEach(error => {
      error.classList.add('animated', 'shake');
    });
  }

  let mainImage = $('.article-show > img');

  if (mainImage != null) {
    console.log('I entered');

    new simpleParallax(mainImage);
  } else {
    console.log('no image');
  }

  let burguer = $('.burguer');

  let menu = $('.access');
  
  console.log(burguer, menu)

  burguer.on('click', event => {
    if (menu.style.right != "0px") {
      menu.style.right = "0px"
    } else {
      menu.style.right = "-200px"
    }
  });

})