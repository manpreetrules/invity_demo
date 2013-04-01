$(document).ready ->
  # $(".invite").fancybox()

  $('.invited').click ->
    length = $('.invited:checked').length
    $('#searchFriends').next('.span3').text("Selected (#{length})")


  invitedIds = []
  $('.button').click ->
    $('.invited:checked').each ->
      invitedIds.push $(this).val()

    return false if invitedIds.length == 0

    new_link = @href + "?ids=#{invitedIds}"
    $(this).prop('href',new_link)
      
    

  # SEARCH FRIENDS IN LIST -----------------------------------------

  friends = $('.friend')

  $('#searchFriends').keyup ->
    results = []
    search  = $(this).val().toLowerCase()

    $.map friends, (obj)->
      results.push(obj) if $(obj).prop('title').toLowerCase().match(search)
    
    friends.hide()
    $(results).show()