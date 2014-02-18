# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->  
  # Switch toggle
  $(".Switch").click ->
    checkbox = $(this).attr("href")
    $(this).toggleClass("On").toggleClass "Off"
    if $(this).hasClass("On")
      document.getElementById(checkbox).checked = true
    else
      document.getElementById(checkbox).checked = false
    return

  return