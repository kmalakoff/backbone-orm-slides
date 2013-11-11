(function() {
  $(function() {
    var syncBody;
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
    syncBody = function(ele) {
      if ($(ele).hasClass('invert')) {
        return $('body').addClass('invert');
      } else {
        return $('body').removeClass('invert');
      }
    };
    syncBody(Reveal.getCurrentSlide());
    Reveal.addEventListener('slidechanged', function(event) {
      return syncBody(event.currentSlide);
    });
    return $(document).on('keyup', function(e) {
      if (e.keyCode === 220) {
        return $('.hidden').toggle();
      }
    });
  });

}).call(this);
