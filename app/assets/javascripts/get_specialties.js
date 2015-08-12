var availableTags = [];

var keyCodes = {
  13: 'enter'
}

$(document).ready(function() {
  getSpecialties();

  $("#tags").autocomplete({
    source: availableTags
  });

  // Make an ajax GET request for all specialties for this user
  $.ajax({
    url: '/user_specialties',
    success: function(data) {
      // Take the raw specialties json, convert to markup,
      // append to the ul
      var markup = data.map(renderSpecialtyLi);
      $('.specialties').append(markup);

       bindDeleteEvent();

    },
    error: function(xhr) {
      console.log(xhr.responseText)
    }
  });

  $("#tags").keypress(function(e){
    if(keyCodes[e.keyCode] === 'enter') {
      var specialtyName = $('input#tags').val();

      console.log('Pressed enter on specialty form!');
      postSpecialty(specialtyName);

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
        if ($.inArray(tag.specialty_name, availableTags) === -1){
          availableTags.push(tag.specialty_name);
        }
      });
    }
  });
};

function postSpecialty(specialtyName) {
  $.ajax({
    url: '/specialties',
    type: 'POST',
    data: {specialty: {specialty_name: specialtyName}},
    dataType: "json",
    success: function(data) {
      // Append the newly created specialty to the DOM
      console.log(data);
      var markup = renderSpecialtyLi(data);

      $('.specialties').append(markup);

      bindDeleteEvent();

    },
    error: function(xhr) {
      console.log(xhr.responseText)
    }
  });
};


/**
 * Take a specialty as a JS object and return an
 * html representation.
 */
function renderSpecialtyLi(specialty) {
  return  (
      "<li data-id='" + specialty.id + "' class='collection-item'>"
      +   "<div class='row'>"
      +     "<div class='col s6'>"
      +       specialty.specialty_name
      +     "</div>"
      +     "<div class='col s6 right-align'>"
      +       "<input data-id='" + specialty.id + "' class='delete-specialty' type='submit' value='Delete'>"
      +     "</div>"
      +   "</div>"
      + "</li>"
      );
}

function bindDeleteEvent() {
  $('.delete-specialty').on('click', function() {
    var id = $(this).data('id');

    $.ajax({
      url: '/user_specialties/1?specialty_id=' + id, // TODO
      type: 'DELETE',
      success: function() {
        // If the server successfuly destroys the specialty,
        // remove it from the DOM
        // removeSpecialty(id)
        var $specialty = $('.specialties li').filter(function() {
          return $(this).data('id') === id;
        });
        $specialty.remove();
      },
      error: function(xhr) {
        console.log(xhr.responseText)
      }
    })
  });

}
