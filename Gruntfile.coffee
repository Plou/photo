"use strict"
request = require("request")
module.exports = (grunt) ->

  # show elapsed time at the end
  require("time-grunt") grunt

  # load all grunt tasks
  require("load-grunt-tasks") grunt
  reloadPort = 35729
  files = undefined
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    develop:
      server:
        file: "app.js"

    watch:
      options:
        nospawn: true
        livereload: reloadPort

      # Express
      js:
        files: ["app.js", "app/**/*.js", "config/*.js"]
        tasks: ["develop", "delayed-livereload"]

      jade:
        files: ["app/views/**/*.jade"]

      # Backbone
      coffeeify:
        files: [
          "public/app/js/*.coffee"
          "public/app/js/**/*.coffee"
          "public/app/js/**/*.html"
        ]
        ignore: [
          "public/app/js/components/*.coffee"
        ]
        tasks: ["browserify"]

      coffee:
        files: [
          "public/app/js/components/src/*.coffee"
        ]
        tasks: ["coffee"]

      sass:
        files: [
          "public/app/css/src/*.scss"
        ]
        tasks: ["sass"]

    browserify:
      app:
        options:
          transform: [
            'coffeeify'
            'node-underscorify'
          ]
          ignore: [
            "public/app/js/components/*.coffee"
          ]
          debug: true
          shim:
            jquery:
              path: 'public/bower_components/jquery/jquery.js'
              exports: '$'
            underscore:
              path: 'public/bower_components/underscore/underscore.js'
              exports: '_'
            backbone:
              path: 'public/bower_components/backbone/backbone.js'
              exports: 'Backbone'
              depends:
                underscore: 'underscore'
            'backbone.babysitter':
              path: 'public/bower_components/backbone.babysitter/lib/backbone.babysitter.js'
              exports: 'Backbone.Babysitter'
              depends:
                backbone: 'Backbone'
            'backbone.wreqr':
              path: 'public/bower_components/backbone.wreqr/lib/backbone.wreqr.js'
              exports: 'Backbone.Wreqr'
              depends:
                backbone: 'Backbone'
            'backbone.marionette':
              path: 'public/bower_components/backbone.marionette/lib/backbone.marionette.js',
              exports: 'Marionette'
              depends:
                jquery: '$'
                backbone: 'Backbone'
                underscore: '_'
        src: [
          'public/app/js/main.coffee'
        ]
        dest: 'public/app/js/main.js'

    coffee:
      options:
        sourcemap: true
        style: "compact"
        precision: 20
        lineNumbers: true
      all:
        files: [
          expand: true
          cwd: 'public/app/js/components/src'
          src: [
            '*.coffee'
            '**/*.coffee'
          ]
          dest: 'public/app/js/components'
          ext: '.js'
        ]

    sass:
      all:
        options:
          sourcemap: true
          style: "compact"
          precision: 20
          lineNumbers: true
        files: ['public/app/css/main.css': 'public/app/css/src/styles.scss']


  grunt.config.requires "watch.js.files"
  files = grunt.config("watch.js.files")
  files = grunt.file.expand(files)
  grunt.registerTask "delayed-livereload", "Live reload after the node server has restarted.", ->
    done = @async()
    setTimeout (->
      request.get "http://localhost:" + reloadPort + "/changed?files=" + files.join(","), (err, res) ->
        reloaded = not err and res.statusCode is 200
        if reloaded
          grunt.log.ok "Delayed live reload successful."
        else
          grunt.log.error "Unable to make a delayed live reload."
        done reloaded

    ), 500

  grunt.registerTask "default", [
    "coffee",
    "browserify",
    "sass",
    "develop",
    "watch"
  ]