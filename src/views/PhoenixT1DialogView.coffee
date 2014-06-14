#
class PhoenixT1DialogView extends View

  render: (viewModel) ->
    @renderButton viewModel

  renderButton:  (viewModel) ->
    buttonTemplate = ->
        li '#filter-button', 'data-name': 'filter', ->
          a '.js-filter-dialog', href: '#', 'data-bind': 'click: toggleEnabled, text: enabledText'

    $('#user-dropdown ul li:nth-child(5)').after CoffeeKup.render buttonTemplate, hardcode:
      label: viewModel.enabledText()

    ko.applyBindings viewModel, $('#filter-button')[0]
