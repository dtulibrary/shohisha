//= require active_admin/base
//(function ($) {
//  $(function () {
//    $("#fetcher_transport_input")
//      .each( function() {
//      });
//  })
//})(jQuery);
// Make sure $ is bound to jQuery
(function ($) {
  // Execute function when document is loaded and ready
  $(function () {
    $('#fetcher_transport_id').change(function () {
      // Get transport ID from select box
      var transportId = $(this).val();
      $('fieldset ol li.transportall').hide();
      $('fieldset ol li.transport' + transportId).show();
    }); 
    $('#fetcher_transport_id').each(function () {
      // Get transport ID from select box
      var transportId = $(this).val();
      $('fieldset ol li.transportall').hide();
      $('fieldset ol li.transport' + transportId).show();
    }); 
  }); 
})(jQuery);
