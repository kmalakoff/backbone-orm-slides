console.log "Hello BackboneORM"

# server
if !window?
  express = require 'express'
  app = express()
  app.use express.bodyParser()
  app.use express.static(__dirname)
  app.get '/', (req, res) -> res.sendfile('./index.html')
  app.listen(3000)





























# bootstrap = (index, callback) ->
#   Project.findOrCreate {index: index, name: "Project #{index}"}, callback

# async.each [0..9], bootstrap, ->
#   Project.find (err, models) ->
#     console.log "find: #{model.get('name')}" for model in models

  # kb = require 'knockback'

  # class window.AppViewModel
  #   constructor: ->
  #     @projects = kb.collectionObservable(new Backbone.Collection())
  #     Project.find {$limit: 3, $sort: '-name'}, (err, models) => @projects.collection().reset(models)

  #   onSave: (vm) -> vm.model().save ->

  # <div class='container' kb-inject="AppViewModel">
  #   <table class='table'>
  #     <thead>
  #       <tr><th>Index</th><th>Name</th><th></th></tr>
  #     </thead>
  #     <tbody data-bind="foreach: projects">
  #       <tr>
  #         <td><input data-bind="value: name"></input></td>
  #         <td data-bind="text: index"></td>
  #         <td><button class='btn' data-bind="click: $parent.onSave">Save</button></td>
  #       </tr>
  #     </tbody>
  #   </table>
  # </div>
