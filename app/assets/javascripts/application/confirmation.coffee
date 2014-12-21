$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  swal {
    title: "Are you sure?",
    text: message,
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#e00000",
    confirmButtonText: "Yes, delete it!",
    closeOnConfirm: false },
    ->
      swal("Deleted!", "Selected item has been deleted.", "success")
      setTimeout(->
        $.rails.confirmed(link)
      , 700)


#  $('#confirmationDialog .confirm')

$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')
