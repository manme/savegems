$ ->
  evil.block '@@gemfileList',

    'click on @addGemfile': (e)->

      $('@@gemfileShow').find('@edit').show()
      $('@@gemfileShow').modal('show')

