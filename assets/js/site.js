
// Turn on Bootstrap tooltips and popovers.
$(function() {
  $('a[data-toggle="tooltip"]').tooltip();
  $('a[data-toggle="popover"]').popover();
});

// Select all when clicking on permalink.
$('body').on('focus', '.permalink-input', function(event) {
    window.setTimeout(function() {
      $(event.target).select();
    }, 100);
});
