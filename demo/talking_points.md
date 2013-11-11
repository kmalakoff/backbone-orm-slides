
Introduction
-------

A live demo to show off the Node.js and Browser flexibility of BackboneORM and some of its features.

Let's hope the demo gods are good to us!

Step 0
-------

We've prepared a couple of files:

- index.html to boilerplate HTML
- app.coffee to set up an express server to get around the same origin policy

If you are running it on your own, we'll be running app.js on both the client and server:

- npm install
- coffee -w -c app.coffee
- nodemon app.js

Watch the terminal for the server and the console in the Browser and you'll see a welcome message: "Hello BackboneORM"

Step 1 - In memory Store
-------

Let's set up an in-memory store on both sides to demonstrate the query syntax by writing to console.log

First, let's require what we need (backbone and async). Next, let's define a Model with an in memory sync.To make it useful, let's bootstrap some data using async.

And finally, let's start querying the data.

- find (same as all without query parameters)
- $limit, $offset, $sort

Show on the server and then browserify and show in the browser.

```
browserify -r backbone-orm -r backbone-http -r backbone -r async > client-bundle.js
```

BackboneORM can be included using standard file-by-file includes, AMD, or CommonJS-like solution like Browserify.

Step 2 - REST and HTTP
-------

Let's create a REST endpoint. Simplfy require 'backbone-rest', specify the model and a route. Done.

Let's take a look on the URL. Show $limit, $offset, $sort

Now let's consume it. Get rid of the bootstrap on the client and just use the raw query interface.

Step 3 - Variants
-------

MongoDB just needs the url to change 'localhost:27017/demo/' and 'backbone-orm' to 'backbone-mongo'.

If we have time, show MongoHub.

Step 4 - Client View
-------

We use Knockback.js so let's add it to the bundle.

```
browserify -r backbone-orm -r backbone-http -r backbone -r async -r knockback > client-bundle.js
```

We'll copy paste some HTML (it'll take to long to write correctly) to inject a ViewModel using Angular-like functionality. And define a ViewModel on the client using the same find query and with a save method.

Refresh, show the table, edit a name, and save it. It should just work ;-P (famous last words)
