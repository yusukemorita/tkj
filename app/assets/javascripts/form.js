console.log('form.js called');

$(function () {

  //initialise datetimepicker
  $('#common-close, #mon-close, #tue-close, #wed-close, #thu-close, #fri-close, #sat-close, #sun-close, #common-open, #mon-open, #tue-open, #wed-open, #thu-open, #fri-open, #sat-open, #sun-open').timepicker({
    timeFormat: 'H:i',
    scrollDefault: '09:00'
  });

  //input existing values
  if (gon.hours) {
    var hours = gon.hours
    if (hours["common_flag"] === true ) {
      //set existing values
      $('#common-open').val(hours["hours"]["open"]);
      $('#common-close').val(hours["hours"]["close"]);
      hours["closed_days"].forEach(function(num) {
        $("input[value=" + num + "]").prop('checked', true);
      })
    } else {
      //show seperate time and switch toggle
      $('#hours-toggle').bootstrapToggle('off');
      $('.common-time').hide();
      $('.seperate-time').show();
      //set existing values
      if (hours["hours"]["mon"]) {
        $('#mon-open').val(hours["hours"]["mon"]["open"]);
        $('#mon-close').val(hours["hours"]["mon"]["close"]);
      }
      if (hours["hours"]["tue"]) {
        $('#tue-open').val(hours["hours"]["tue"]["open"]);
        $('#tue-close').val(hours["hours"]["tue"]["close"]);
      }
      if (hours["hours"]["wed"]) {
        $('#wed-open').val(hours["hours"]["wed"]["open"]);
        $('#wed-close').val(hours["hours"]["wed"]["close"]);
      }
      if (hours["hours"]["thu"]) {
        $('#thu-open').val(hours["hours"]["thu"]["open"]);
        $('#thu-close').val(hours["hours"]["thu"]["close"]);
      }
      if (hours["hours"]["fri"]) {
        $('#fri-open').val(hours["hours"]["fri"]["open"]);
        $('#fri-close').val(hours["hours"]["fri"]["close"]);
      }
      if (hours["hours"]["sat"]) {
        $('#sat-open').val(hours["hours"]["sat"]["open"]);
        $('#sat-close').val(hours["hours"]["sat"]["close"]);
      }
      if (hours["hours"]["sun"]) {
        $('#sun-open').val(hours["hours"]["sun"]["open"]);
        $('#sun-close').val(hours["hours"]["sun"]["close"]);
      }
    }
  }

  makeHash();

  //listen for toggle change
  $('#hours-toggle').change(function() {
    var toggle_val = $('#hours-toggle').prop('checked');
    if (toggle_val === false) {
      $('.checked-title').css({
        "color": "#ec971f"
      });
      $('.unchecked-title').css({
        "color": "grey"
      });
      $('.seperate-time').hide();
      $('.common-time').show();
    } else {
      $('.checked-title').css({
        "color": "grey"
      });
      $('.unchecked-title').css({
        "color": "#2196F3"
      });
      $('.common-time').hide();
      $('.seperate-time').show();
    }
  });

  function makeHash(){

    //営業時間が毎日共通の場合
    if ($('#hours-toggle').prop('checked') === false) {
      var closed_days = []
      var checkboxes = ['mon-box', 'tue-box', 'wed-box', 'thu-box', 'fri-box', 'sat-box', 'sun-box']
      checkboxes.forEach(function(item) {
        if($('#' + item).prop('checked')){
          closed_days.push($('#' + item).val());
        };
      });
      //レコード
      var hours_hash = {
        common_flag: true,
        hours: { open: $('#common-open').val(), close: $('#common-close').val()},
        closed_days: closed_days};

    //曜日ごとに営業時間が異なる場合
    } else {

      //レコード
      var hours_hash = {
        common_flag: false,
        hours: {}
      }

      //曜日ごとに時間を登録
      var days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
      days.forEach(function(item) {
        if ($('#' + item + '-open').val() != '' && $('#' + item + '-close').val() != '') {
          hours_hash.hours[item] = {open: $('#' + item + '-open').val(), close: $('#' + item + '-close').val()}
        }
      });

    }

    //railsのhoursのhidden_inputにhours_hashを代入
    console.log(hours_hash);
    $('#hours_input').val(JSON.stringify(hours_hash))
  };

  //listen for input change
  $('#hours-toggle, #common-close, #mon-close, #tue-close, #wed-close, #thu-close, #fri-close, #sat-close, #sun-close, #common-open, #mon-open, #tue-open, #wed-open, #thu-open, #fri-open, #sat-open, #sun-open, #mon-box, #tue-box, #wed-box, #thu-box, #fri-box, #sat-box, #sun-box').change( makeHash );

});
