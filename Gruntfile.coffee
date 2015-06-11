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
    "develop",
    "watch"
  ]
