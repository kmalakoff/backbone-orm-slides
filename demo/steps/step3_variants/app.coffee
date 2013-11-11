Backbone = require 'backbone'
async = require 'async'

if window?
  class Project extends Backbone.Model
    urlRoot: 'http://localhost:3000/projects'
    sync: require('backbone-http').sync(Project)

  # find
  Project.find (err, models) -> console.log model.get('name') for model in models

else
  express = require 'express'
  RestController = require 'backbone-rest'

  # in memory
  class Project extends Backbone.Model
    urlRoot: '/projects'
    sync: require('backbone-orm').sync(Project)

  # mongo
  class Project extends Backbone.Model
    urlRoot: 'mongodb://localhost:27017/demo/projects'
    sync: require('backbone-mongo').sync(Project)

  # postgres
  class Project extends Backbone.Model
    urlRoot: 'postgres://localhost:27017/demo/projects'
    schema:
      index: ['Integer']
      name: ['String']
    sync: require('backbone-sql').sync(Project)
  # put around bootstrap first time: Project.resetSchema ->

  app = express()

  app.use express.static(__dirname)
  app.get '/', (req, res) -> res.sendfile('./index.html')

  new RestController app, {model_type: Project, route: '/projects'}
  app.listen(3000)

  # bootstrap
  async.each [1..9], ((index, callback) -> Project.findOrCreate {index: index, name: "Project #{index}"}, callback), (err) ->

    # find
    Project.find (err, models) -> console.log model.get('name') for model in models
