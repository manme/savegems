$ ->
  evil.block '@@gemList',

    'click on @composeGemfile': (e)->
      gemItems = @select.filter(':checked').parents('@@gemItem').toArray().slice(0).reverse()
      content = ''

      for i, gemItem of gemItems
        content += $(gemItem).find('@original').val() + '\n'

      $('@@gemfileShow').find('@form').attr 'action', @composeGemfile.attr('data-action')
      $('@@gemfileShow').find('*[name="_method"]').attr 'value', @composeGemfile.attr('data-method')
      $('@@gemfileShow').find('@content').val(content)
      $('@@gemfileShow').find('@name').val('')


      $('@@gemfileShow').find('@save').removeClass('active')
      $('@@gemfileShow').modal('show')

    init: ->
      @select.click (e)=>
        if @select.filter(':checked').size() > 0
          @composeGemfile.addClass('active')
        else
          @composeGemfile.removeClass('active')
