Step 1 - Server
--------

- start with index.html

- urlRoot
- async.each [0..9], ((index, callback) -> Project.findOrCreate {index: index, name: "Project #{index}"}, callback), (err) ->

Step 1 - Client
--------

- index.html
- browserify -r backbone-orm -r backbone-http -r backbone -r async -r knockback > client-bundle.js
- coffee -w -c app.coffee

- same origin - host index.html from the server

  express = require 'express'
  app = express()
  app.use express.static(__dirname)
  app.get '/', (req, res) -> res.sendfile('./index.html')
  app.listen(3000)

Step 2
--------

- rest
  RestController = require 'backbone-rest'
  new RestController app, {model_type: Project, route: '/projects'}

Step 3 - Variants
--------
- urlRoot: 'mongodb://localhost:27017/demo/projects'

Step 4
--------

- include
  kb = require 'knockback'

  class window.AppViewModel
    constructor: ->
      @projects = kb.collectionObservable(new Backbone.Collection())
      Project.cursor({$limit: 6}).sort('name').toModels (err, models) => @projects.collection().reset(models)

- inject view model
  <div class='container' kb-inject="AppViewModel">
    <table class='table'>
      <thead>
        <tr><th>Name</th><th>Index</th></tr>
      </thead>
      <tbody data-bind="foreach: projects">
        <tr>
          <td data-bind="text: name"></td>
          <td data-bind="text: index"></td>
        </tr>
      </tbody>
    </table>
  </div>
