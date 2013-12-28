upload_template = require '../templates/upload.html'

module.exports = class UploadView extends Backbone.View
  el: '[data-view="upload"]'
  template: upload_template

  events:
    "submit .form": "processForm"

  initialize: (options) ->
    true
  processForm: (e) ->
    # e.preventDefault()

  render: () ->
    @.$el.html @.template