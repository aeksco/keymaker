

class DashboardView extends Mn.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  ui:
    key: '[data-click=key]'

  events:
    'click @ui.key': 'onKeyClick'

  # Maintains key state
  # TODO - should be backbone models?
  keys: []

  # KeyClick callback
  onKeyClick: (e) ->
    console.log e
    console.log 'CLICKED'

    # Caches el and key
    el  = $(e.currentTarget)
    key = el.data('key')

    # Toggle ON
    if @keys.indexOf(key) < 0

      @keys.push(key)
      el.addClass('active')

    # TOGGLE OFF
    else
      el.removeClass('active')
      @keys = _.without(@keys, key)

    # Blurs focus off clicked key
    el.blur()

    console.log @keys

    return

# # # # #

module.exports = DashboardView


