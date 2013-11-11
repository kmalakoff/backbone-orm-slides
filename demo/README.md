# Install

###Server

Install the application

```
npm install
```

Run the application

```
npm start
```

###Client

Create a client bundle (without Knockback)

```
browserify -r backbone-orm -r backbone-http -r backbone -r async > client-bundle.js
```

Create a client bundle (with Knockback)

```
browserify -r backbone-orm -r backbone-http -r backbone -r async -r knockback > client-bundle.js
```

Watch the CoffeeScript

```
coffee -w -c app.coffee
```