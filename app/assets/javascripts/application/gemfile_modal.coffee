$ ->
  evil.block '@@gemfileShow',

    'input on @name': (e)->
      if @name.val().length > 0
        @save.addClass('active')
      else
        @save.removeClass('active')
#
#    'click on @save': (e)->
#      $.ajax
#        url:  @block.attr('data-url')
#        type:  @block.attr('data-action')
#        dataType: 'json'
#        data: @form.serialize()
#      .done (msg)=>
#        console.log msg
#        @block.modal('hide')
#
#      .fail ()=>
#        sweetAlert("Oops...", "Something went wrong!", "error");

    init: ->
