$ ->
  evil.block '@@gemfileList',

    'click on @addGemfile': (e)->
      $('@@gemfileShow').find('@form').attr 'action', @addGemfile.attr('data-action')
      $('@@gemfileShow').find('@form').attr 'method', @addGemfile.attr('data-method')

      $('@@gemfileShow').find('@edit').show()
      $('@@gemfileShow').modal('show')

    'click on @select': (e)->
      gemfile = $(e.el).parents('@gemfile')

      $('@@gemfileShow').find('@form').attr 'action', gemfile.attr('data-action')
      $('@@gemfileShow').find('*[name="_method"]').attr 'value', gemfile.attr('data-method')
      $('@@gemfileShow').find('@name').val gemfile.find('@name').html()
      $('@@gemfileShow').find('@content').val gemfile.find('@content').html()

      $('@@gemfileShow').find('@name').trigger('input')

      $('@@gemfileShow').find('@edit').show()
      $('@@gemfileShow').modal('show')



