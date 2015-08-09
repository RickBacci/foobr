$(document).ready(function() {
  // Get a list of all developers
  var allDevelopers = $('.developer');

  // Add a 'change' event handler for the input element
  $('input.search-specialty').on('change keyup', function(e) {
    //  Get the value of the search text
    var searchText = e.target.value;

    $(allDevelopers).each(function (index, developer) {
      var specialtyName = $(developer).find('.specialty').text().toLowerCase();

      var matches = specialtyName.toLowerCase().indexOf(searchText) !== -1;

      $(developer).toggle(matches);
    });
  });
});

