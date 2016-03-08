$(document).on("page:change", function() {
     $(".navbar .dropdown").hover((function() {
         $(this).find(".dropdown-menu").first().stop(true, true).delay(150).slideDown();
    }), function() {
         $(this).find(".dropdown-menu").first().stop(true, true).delay(50).slideUp();
    });
  });