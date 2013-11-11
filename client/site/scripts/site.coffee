
$ ->

  # Full list of configuration options available here:
  # https://github.com/hakimel/reveal.js#configuration
  Reveal.initialize({
    controls: true,
    progress: true,
    history: true,
    center: true,

    theme: Reveal.getQueryHash().theme or 'default', # available themes are in /css/theme
    transition: Reveal.getQueryHash().transition or 'default', # default/cube/page/concave/zoom/linear/fade/none

    # Optional libraries used to extend on reveal.js
    dependencies: [
      { src: 'plugin/highlight/highlight.js', async: true, callback: -> hljs.initHighlightingOnLoad() }
      { src: 'plugin/zoom-js/zoom.js', async: true }
      { src: 'plugin/notes/notes.js', async: true }
    ]
  });

  syncBody = (ele) ->
    if $(ele).hasClass('invert')
      $('body').addClass('invert')
    else
      $('body').removeClass('invert')

  syncBody(Reveal.getCurrentSlide())

  Reveal.addEventListener 'slidechanged', (event) ->
    syncBody(event.currentSlide)
