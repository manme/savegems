$ ->
  evil.block '@@gemItem',

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
        @editGemIcon.toggleClass('active')
        @editGemFields.toggleClass('active')

        if @editGemIcon.hasClass('active') && !@expandGemInfo.hasClass('active')
          @expandGemIcon.trigger('click')
        if !@editGemIcon.hasClass('active') && @expandGemInfo.hasClass('active')
          @expandGemIcon.trigger('click')
