Backbone = require 'backbone'
async = require 'async'

if window?
  class Project extends Backbone.Model
    urlRoot: 'http://localhost:3000/projects'
    sync: require('backbone-http').sync(Project)

  # find
  Project.find (err, models) -> console.log model.get('name') for model in models

  # url: http://localhost:3000/projects?$values=id
  # url: http://localhost:3000/projects?$select=["index","name"]
  # url: http://localhost:3000/projects?$sort=name
  # url: http://localhost:3000/projects?$sort=-name

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
