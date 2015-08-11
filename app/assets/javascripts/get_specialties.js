var availableTags = [];

$(document).ready(function() {

  getSpecialties();

  $("#tags").autocomplete({
    source: availableTags
  });

  $("#tags").keypress(function(e){
    if(e.keyCode == 13)
    {
      postSpecialties();
      console.log('key pressed!');

      $('.ui-widget-content').hide();
      $(this).val('');
    }
  });

});

function getSpecialties() {
  $.ajax({
    url: '/get_specialties',
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

function postSpecialties() {
  var specialtyName = $('input#tags').val();
  $.ajax({
    url: '/specialties',
    type: 'POST',
    data: {specialty: {specialty_name: specialtyName }},
    dataType: "json",
    success: function(refreshSpecialties) {
      console.log("hello world")
      $('ul.collection').prepend(
          "<li class='collection-item'>"
          + refreshSpecialties
          + "</li>"
          )
    },
    error: function(xhr) {
      console.log(xhr.responseText)
    }
  });

};

