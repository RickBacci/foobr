$(document).ready(function() {
  // Get a list of all developers
  var allDevelopers = $('tr.developer');

  // Add a 'change' event handler for the input element
  $('input.search-specialty').on('change keyup', function(e) {
    //  Get the value of the search text
    var searchText = e.target.value;

    $(allDevelopers).each(function (index, developer) {
      var name = $(developer).find('.name').text().toLowerCase();

      var matches = name.toLowerCase().indexOf(searchText) !== -1;

      $(developer).toggle(matches);
    });
  });
});

