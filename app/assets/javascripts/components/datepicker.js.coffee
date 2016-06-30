$(document).on 'ready turbolinks:load', ->
  $('#datepicker').datepicker(
    format: 'dd-mm-yyyy',
    language: "fr",
    autoclose: true,
    todayBtn: 'linked',
    todayHighlight: true,
  );
