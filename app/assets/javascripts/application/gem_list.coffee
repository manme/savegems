$ ->
  evil.block '@@gemList',

    'click on @composeGemfile': (e)=>
      @select.parents(@)

    init: ->
      @select.click (e)=>
        if @select.filter(':checked').size() > 0
          @composeGemfile.addClass('active')
        else
          @composeGemfile.removeClass('active')
