$ ->
  evil.block '@@addGem',

    showOptions: (show) ->
      if show
        @optionValues.addClass('show')
      else
        @optionValues.removeClass('show')

    init: ->

      @optionsExpand.click (e) =>
        e.preventDefault()
        @optionsExpand.hide()
        @optionsCollapse.show()
        @showOptions(true)

      @optionsCollapse.click (e) =>
        e.preventDefault()
        @optionsExpand.show()
        @optionsCollapse.hide()
        @showOptions(false)
