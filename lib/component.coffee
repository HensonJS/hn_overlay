
class OverlayView extends Mn.LayoutView
  template: false
  className: 'overlay'

  events:
    'click': 'onClick'

  onClick: ->
    Backbone.Radio.channel('sidebar').trigger('hide')

# # # # #

class OverlayComponent extends Mn.Service

  initialize: (options = {}) ->
    @container  = options.container

  radioEvents:
    'overlay ready':  'onReady'
    'overlay show':   'showOverlay'
    'overlay hide':   'hideOverlay'

  showOverlay: ->
    $('.overlay-region').addClass('active')

  hideOverlay: ->
    $('.overlay-region').removeClass('active')

  onReady: ->
    unless @view
      @view = new OverlayView()
      @container.show(@view)

# # # # #

module.exports = OverlayComponent
