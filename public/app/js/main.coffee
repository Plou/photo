$ = require 'jquery'
_ = require 'underscore'
Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
AppRouter = require './routes/routes.coffee'

window.publicApp = new Backbone.Marionette.Application()

publicApp.addRegions
  main: '[data-view="main"]'
  upload: '[data-view="upload"]'

publicApp.addInitializer (options) ->
  new AppRouter()
  Backbone.history.start(pushState: false)


$ ->
  publicApp.start()
