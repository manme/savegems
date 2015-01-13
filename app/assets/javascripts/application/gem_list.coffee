$ ->
  evil.block '@@gemList',

    'click on @composeGemfile': (e)->
      gemItems = @select.filter(':checked').parents('@@gemItem').toArray().slice(0).reverse()
      content = ''

      for i, gemItem of gemItems
        content += $(gemItem).find('@original').val() + '\n'

      $('@@gemfileShow').find('@content').val(content)
      $('@@gemfileShow').modal('show')

    init: ->
      @select.click (e)=>
        if @select.filter(':checked').size() > 0
          @composeGemfile.addClass('active')
        else
          @composeGemfile.removeClass('active')
