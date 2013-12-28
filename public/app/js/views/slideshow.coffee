module.exports = class SlideshowView extends Backbone.View
  el: '[data-view="slideshow"]'

  events:
    "click .close": "close"

  initialize: (options) ->
    options.content = options.content.replace(/thumb/g, 'MD')
    options.content = options.content.replace(/width="112"/g, '')
    @.$el
      .append('<button class="close btn">X</button')
      .append('<div class="slideshow">'+options.content+'</div>')
      .fadeIn()
      .find('.slideshow')
      .fade('.image')

  close: () ->
    @.$el
      .fadeOut()
      .empty()
