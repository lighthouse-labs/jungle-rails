$(document).ready( function () {
  //toggle review form field for /products/:id
  $('#review-form-toggle').on('click', function(event) {
    event.stopPropagation();
    $("#product-review").slideToggle();
  });
});