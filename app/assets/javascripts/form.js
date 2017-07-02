console.log('form.js called');

$(function () {

  //initialise datetimepicker
  $('#common-close, #mon-close, #tue-close, #wed-close, #thu-close, #fri-close, #sat-close, #sun-close, #common-open, #mon-open, #tue-open, #wed-open, #thu-open, #fri-open, #sat-open, #sun-open').timepicker({
    timeFormat: 'H:i'
  });

  //listen for toggle change
  $('#hours-toggle').change(function() {
    $('.seperate-time').toggle();
    $('.common-time').toggle();
  });

  //listen for input change
  $('#hours-toggle, #common-close, #mon-close, #tue-close, #wed-close, #thu-close, #fri-close, #sat-close, #sun-close, #common-open, #mon-open, #tue-open, #wed-open, #thu-open, #fri-open, #sat-open, #sun-open, #mon-box, #tue-box, #wed-box, #thu-box, #fri-box, #sat-box, #sun-box').change(function() {

    //営業時間が毎日共通の場合
    if ($('#hours-toggle').prop('checked') === true) {
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
    console.log(hours_hash)
    $('#hours_input').val(JSON.stringify(hours_hash))
  });

});
