# The extension view model is powered by Knockout.js
# See http://knockoutjs.com/documentation/observables.html
class DialogViewModel

  # Settings names and defaults
  settings:
    termsList       : ''
    usersList       : ''
    enabled         : yes

  constructor: ->
    @enabled = ko.observable yes
    # Define computed properties
    @enabledText = ko.computed => if @enabled() then messages.get('enable') else messages.get('disable')
    x = @
    $.ajax url: 'https://s3-us-west-2.amazonaws.com/parha.me/football.json', dataType: 'json', async: false, success: (data) ->
      x.termsList = ko.observable data['terms']
      x.usersList = ko.observable data['users']

  # Subscribe to all settings
  onSettingsChange: (callback) ->
    for setting of @settings
      @[setting].subscribe callback

  toggle: (attr) ->
    @[attr] !@[attr]()

  toggleEnabled: -> @toggle 'enabled'
