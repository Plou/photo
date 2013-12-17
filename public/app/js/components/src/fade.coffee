$ ->
  $.fn.fade = ( selector = '.item') ->
    stopAutoTimer = ->
      clearInterval autoTimer

    resetAutoTimer  = ->
      clearInterval(autoTimer)
      autoTimer = setInterval ->
        goTo $screen.data('index')+1
      , 7000

    goTo = (index) ->
      unless $screen.data('busy')
        $screen.data('busy', true)

        index = 0  if index + 1 > slidesLength
        index = slidesLength-1  if index < 0

        $($controls.find('button')[index])
          .addClass('active')
          .siblings()
          .removeClass('active')

        $($slides[index])
        .css('z-index', 100)
        .fadeIn(1500)

        setTimeout ->
          $($slides[index])
                .css( 'z-index', 99 )
            .siblings().each( ->
              $(this)
                .css( 'z-index', $(this).data('z-index') )
                .hide()
            )
          $screen.data('busy', false);
        , 1500

        $screen.data('index', index)
        # resetAutoTimer()

    # Initialize
    $screen = $(this)
    $slides = $(this).find(selector)
    slidesLength = $slides.length
    autoTimer = setInterval(->)
    $screen
      .data('index', 0)
      .addClass 'slideshow-active'

    $slides.css
      'position': 'absolute'
      'top' : 0
      'right' : 0
      'bottom' : 0
      'left' : 0
      'display': 'block'

    $($slides[$screen.data('index')]).siblings().hide()

    # add controls
    $controls = $('<div class="controls" />')

    $slides.each (i) ->
      $(this)
        .css('z-index', slidesLength-i)
        .data('z-index', slidesLength-i)
      $controls.append $('<button class="control" href="#">'+i+'</button>')

    $controls.find(".control:first-child").addClass "active"
    $screen.after $controls

    # resetAutoTimer()

    $controls.click (e) ->
      e.preventDefault()
      goTo $(e.target).closest('button').index()



    $(this).on 'stop', ->
      stopAutoTimer()