# browserify -r backbone-orm -r backbone-http -r backbone -r async > client-bundle.js

Backbone = require 'backbone'
async = require 'async'

class Project extends Backbone.Model
  urlRoot: '/projects'
  sync: require('backbone-orm').sync(Project)

# bootstrap
async.each [1..9], ((index, callback) -> Project.findOrCreate {index: index, name: "Project #{index}"}, callback), (err) ->

  # find
  Project.find (err, models) -> console.log model.get('name') for model in models

  # # each
  # Project.each ((model, callback) -> console.log model.get('name'); callback()), (err) ->

  # # values
  # Project.cursor().values('name').toJSON (err, names) -> console.log names.join('\n')

  # # values
  # Project.cursor({index: {$lte: 3}}).values('name').toJSON (err, names) -> console.log names.join('\n')

  # # select
  # Project.cursor({index: {$lte: 3}}).select(['index', 'name']).toJSON (err, info) -> console.log item for item in info
