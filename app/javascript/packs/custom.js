//require('./bling.js')

window.onload = event => {
  console.log('dogo');
  let errors = document.querySelectorAll('.field_with_errors');
  

  if (errors.length == 0) {
    console.log('no errors');
  } else {
    errors.forEach(error => {
      error.classList.add('animated', 'shake');
    });
  }
}