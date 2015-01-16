$ ->
  evil.block '@@gemItem',

    editGemForm: ->
      @editGemIcon.toggleClass('hide')
      @updateEditGemIcon.toggleClass('hide')
      @cancelEditGemIcon.toggleClass('hide')

      @editGemFields.toggleClass('active')

      if @editGemIcon.hasClass('hide')
        $.each @editGemFields, (i,v)->
          $(v).removeAttr('disabled')
        @active.removeAttr('disabled')
      else
        $.each @editGemFields, (i,v)->
          $(v).attr('disabled', 'disabled')
        @active.attr('disabled', 'disabled')

      if @editGemIcon.hasClass('hide') && !@expandGemInfo.hasClass('active')
        @expandGemIcon.trigger('click')
      if !@editGemIcon.hasClass('hide') && @expandGemInfo.hasClass('active')
        @expandGemIcon.trigger('click')


    copyOldValues: ->
      $.each @editGemFields, (i,v)->
        $(v).val($(v).attr('data-value'))

      if @active.attr('data-value') == 'true'
        @active.prop('checked', true)
      else
        @active.removeAttr('checked')

    updateNewValues: (cb)->
      url = @updateEditGemIcon.attr('href')

      $.ajax
        url: url
        type: 'PUT'
        dataType: 'json'
        data: @block.serialize()
      .done (msg)=>
        console.log msg
        @description.val(msg.description)
        @description.attr('data-value', msg.description)
        @original.val(msg.original)
        @original.attr('data-value', msg.original)
        @active.prop('checked', msg.active)
        @active.attr('data-value', msg.active)
        if msg.active
          @expandGemIcon.addClass('actived')
        else
          @expandGemIcon.removeClass('actived')

      .fail ()=>
        sweetAlert("Oops...", "Something went wrong!", "error");
      .always =>
        cb.call(this)

    'click on @originField': (e)->
      if $(e.currentTarget).hasClass('origin-field')
        console.log $(e.currentTarget).attr('class')
        @expandGemIcon.trigger('click')

    'click on @expandGemIcon': (e) ->
      e.preventDefault()
      @expandGemIcon.toggleClass('active')
      @expandGemInfo.toggleClass('active')
      @block.toggleClass('active')

#      'click on @exportGemIcon.click': (e) ->
#        e.preventDefault()
#        @exportGemIcon.toggleClass('active')
#        @exportGemField.toggleClass('active')

    'click on @linkGemIcon': (e) ->
      e.preventDefault()
      @linkGemIcon.toggleClass('active')
      @linkGemField.toggleClass('active')

    'click on @editGemIcon': (e) ->
      e.preventDefault()
      @editGemForm()

    'click on @cancelEditGemIcon': (e) ->
      e.preventDefault()
      @copyOldValues()
      @editGemForm()

    'click on @updateEditGemIcon': (e) ->
      e.preventDefault()
      @updateNewValues(@editGemForm)


