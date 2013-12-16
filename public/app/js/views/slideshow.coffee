module.exports = class SlideshowView extends Backbone.View
  el: '[data-view="slideshow"]'

  events:
    "click .close": "close"

  initialize: (options) ->
    @.$el
      .append('<button class="close">close</button')
      .append(options.content)
      .fadeIn()
  close: () ->
    @.$el
      .fadeOut()
      .empty()
