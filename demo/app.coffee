Backbone = require 'backbone'
async = require 'async'

# client
if window?
  kb = require 'knockback'

  class Project extends Backbone.Model
    urlRoot: '/projects'
    sync: require('backbone-http').sync(Project)

  class window.AppViewModel
    constructor: ->
      @projects = kb.collectionObservable(new Backbone.Collection())
      Project.find {$limit: 3, $sort: '-name'}, (err, models) => @projects.collection().reset(models)

    onSave: (vm) -> vm.model().save ->

# server
if !window?
  express = require 'express'
  app = express()
  app.use express.bodyParser()
  app.use express.static(__dirname)
  app.get '/', (req, res) -> res.sendfile('./index.html')
  app.listen(3000)

  class Project extends Backbone.Model
    urlRoot: 'mongodb://localhost:27017/demo/projects'
    sync: require('backbone-mongo').sync(Project)

  RESTController = require 'backbone-rest'
  new RESTController app, {model_type: Project, route: '/projects'}

  bootstrap = (index, callback) ->
    Project.findOrCreate {index: index, name: "Project #{index}"}, callback

  async.each [0..9], bootstrap, ->

    Project.find {$limit: 5, $sort: 'name'}, (err, models) ->
      console.log "find: #{model.get('name')}" for model in models




























# bootstrap = (index, callback) ->
#   Project.findOrCreate {index: index, name: "Project #{index}"}, callback

# async.each [0..9], bootstrap, ->
#   Project.find (err, models) ->
#     console.log "find: #{model.get('name')}" for model in models
