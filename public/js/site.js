(function() {
  $(function() {
    return Reveal.initialize({
      controls: true,
      progress: true,
      history: true,
      center: true,
      theme: Reveal.getQueryHash().theme || 'default',
      transition: Reveal.getQueryHash().transition || 'default',
      dependencies: [
        {
          src: 'plugin/highlight/highlight.js',
          async: true,
          callback: function() {
            return hljs.initHighlightingOnLoad();
          }
        }, {
          src: 'plugin/zoom-js/zoom.js',
          async: true
        }, {
          src: 'plugin/notes/notes.js',
          async: true
        }
      ]
    });
  });

}).call(this);
