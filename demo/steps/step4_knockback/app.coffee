# browserify -r backbone-orm -r backbone-http -r backbone -r async -r knockback -r knockout > client-bundle.js

Backbone = require 'backbone'
async = require 'async'

if window?
  kb = require 'knockback'

  class Project extends Backbone.Model
    urlRoot: 'http://localhost:3000/projects'
    sync: require('backbone-http').sync(Project)

  class Projects extends Backbone.Collection
    model: Project

  class window.AppViewModel
    constructor: ->
      @projects = kb.collectionObservable(new Projects())
      Project.find (err, models) => @projects.collection().reset(models)
      # Project.cursor({$limit: 3, $offset: 3, $sort: '-name'}).toModels (err, models) => @projects.collection().reset(models)
      # Project.cursor().limit(3).offset(3).sort('-name').toModels (err, models) => @projects.collection().reset(models)

else
  express = require 'express'
  RestController = require 'backbone-rest'

  class Project extends Backbone.Model
    urlRoot: '/projects'
    sync: require('backbone-orm').sync(Project)

  app = express()

  app.use express.static(__dirname)
  app.get '/', (req, res) -> res.sendfile('./index.html')

  new RestController app, {model_type: Project, route: '/projects'}
  app.listen(3000)

  # bootstrap
  async.each [1..9], ((index, callback) -> Project.findOrCreate {index: index, name: "Project #{index}"}, callback), (err) ->

    # find
    Project.find (err, models) -> console.log model.get('name') for model in models
