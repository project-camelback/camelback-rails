# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $(".edit").editable "/"  #URL to post edits

$(document).ready ->
  $(".editable_area").editable "http://www.example.com/save.php",
    type: "textarea"
    cancel: "Cancel"
    submit: "Save"
    indicator: "<img src=\"img/indicator.gif\">"
    tooltip: "Click to edit..."
    cssclass : 'editable_field'

