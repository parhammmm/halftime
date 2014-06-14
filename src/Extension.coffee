#
class Extension

  # Select the most suitable provider
  provider: Provider.getActive PhoenixT1Provider, HighlineProvider

  constructor: ->

    # The view models are powered by Knockout
    # See http://knockoutjs.com/documentation/observables.html
    @dialogViewModel = new DialogViewModel
    @provider.dialogView.render @dialogViewModel

    # Apply filter on changes
    $(window)         .on 'hashchange',  => setTimeout (=> @applyFilter()), 500
    @provider         .onNewTweets                      => @applyFilter()
    @dialogViewModel  .onSettingsChange                 => @applyFilter()

    # Apply filter right now!
    @applyFilter()

  # The extension's heart
  applyFilter: -> @throttle 10, =>

    apply = @dialogViewModel.enabled() and @provider.filterCurrentPage()

    if apply
      termsRegExp = @filterRegExp @filterPattern @dialogViewModel.termsList(), false
      usersRegExp = @filterRegExp @filterPattern @dialogViewModel.usersList(), true

    hiddenCount = 0
    hiddenUsers = {}

    @provider.tweets().each (i, el) =>

      termsMatch = false
      usersMatch = false

      if apply
        tweetAuthor = @provider.tweetAuthor(el)

        # Terms
        if termsRegExp?
          termsRegExp.lastIndex = 0
          foundTermsMatches = termsRegExp.test @provider.tweetText(el)
          termsMatch = foundTermsMatches

        # Users (author or retweeter)
        if usersRegExp?
          usersRegExp.lastIndex = 0
          foundUserMatches = usersRegExp.test tweetAuthor
          if not foundUserMatches
            usersRegExp.lastIndex = 0
            foundUserMatches = usersRegExp.test @provider.tweetRetweeter(el)
          usersMatch = foundUserMatches

      if termsMatch or usersMatch
        el.style.display = 'none' # Faster than jQuery 'hide' which causes reflow and repaint (call to getComputedStyle).
        hiddenCount++
        if not (tweetAuthor of hiddenUsers)
          hiddenUsers[tweetAuthor] = @provider.tweetAuthorPhoto(el)
      else
        el.style.display = 'block'  # Faster than jQuery 'show' which causes reflow and repaint (call to getComputedStyle).

  # Cancelable timeout to avoid too many consecutive calls
  throttle: do ->
    timeout = {}
    (delay, fn) ->
      key = fn.toString()
      clearTimeout timeout[key]
      timeout[key] = setTimeout fn, delay

  # Build a filter regular expression pattern
  filterPattern: (csv, whole) ->
    values = csv.split ','
    values = $.map values, (v, i) ->
      v = $.trim v
      if v.length > 2 and v[0] == '/' and v[v.length - 1] == '/'
        # support user regexes
        v.substr 1, v.length - 2
      else
        # escape some characters
        v.replace /([\.\(\)\[\]\{\}\+\*\?\\])/g, '\\$1'

    values = $.grep values, (v, i) -> v != ''

    return null if values.length is 0

    values = '('+ values.join('|') + ')'
    if whole then "^#{values}$" else values

  # Build an actual regular expression
  filterRegExp: (pattern) ->
    return null unless pattern?
    try
      new RegExp pattern, 'gi'
    catch e
      null

# Go!
new Extension()
