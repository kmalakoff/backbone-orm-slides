(function() {
  $(function() {
    var syncBody;
    syncBody = function(ele) {
      if ($(ele).hasClass('invert')) {
        return $('body').addClass('invert');
      } else {
        return $('body').removeClass('invert');
      }
    };
    syncBody($('section.first'));
    Reveal.initialize({
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
    return Reveal.addEventListener('slidechanged', function(event) {
      console.log(event.currentSlide, event.indexh, event.indexv);
      return syncBody(event.currentSlide);
    });
  });

}).call(this);
