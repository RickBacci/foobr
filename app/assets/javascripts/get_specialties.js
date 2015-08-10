var availableTags = [];

$(document).ready(function() {

  getSpecialties();

  $( "#tags" ).autocomplete({
    source: availableTags
  });

});

function getSpecialties() {
  $.ajax({
    url: 'http://localhost:3000/get_specialties',
    type: 'GET',
    success: function(tags) {
      $.each(tags, function(index, tag){
        if($.inArray(tag.specialty_name, availableTags) === -1){
          availableTags.push(tag.specialty_name);
        };
      });
    }
  });

};

