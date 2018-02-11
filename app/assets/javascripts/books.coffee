$(document).ready ->
  if $('#books-show').length
    $('#read-link').click (event) ->
      event.preventDefault()
      $('#full-desc').toggle(true)
      $('#short-desc').toggle(false)

    $('#hide-link').click (event) ->
      event.preventDefault()
      $('#full-desc').toggle(false)
      $('#short-desc').toggle(true)

    $('#add-button').click (event) ->
      $('#add-button').addClass('disabled')
      $('#buttons').toggle(false)

  if $('#books-show, #carts-show').length
    $('.quantity-plus').click (event) ->
      event.preventDefault()
      old_value = parseInt($('.quantity-input').val())
      $('.quantity-input').val(old_value + 1)

    $('.quantity-minus').click (event) ->
      event.preventDefault()
      old_value = parseInt($('.quantity-input').val())
      if old_value > 1
        $('.quantity-input').val(old_value - 1)
