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

    init: ->

      @expandGemIcon.click (e) =>
        e.preventDefault()
        @expandGemIcon.toggleClass('active')
        @expandGemInfo.toggleClass('active')
        @block.toggleClass('active')

#      @exportGemIcon.click (e) =>
#        e.preventDefault()
#        @exportGemIcon.toggleClass('active')
#        @exportGemField.toggleClass('active')

      @linkGemIcon.click (e) =>
        e.preventDefault()
        @linkGemIcon.toggleClass('active')
        @linkGemField.toggleClass('active')

      @editGemIcon.click (e) =>
        e.preventDefault()

        @editGemForm()

      @cancelEditGemIcon.click (e) =>
        e.preventDefault()
        @copyOldValues()
        @editGemForm()

      @updateEditGemIcon.click (e) =>
        e.preventDefault()
        @updateNewValues(@editGemForm)

