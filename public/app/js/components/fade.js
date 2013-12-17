(function() {
  $(function() {
    return $.fn.fade = function(selector) {
      var $controls, $screen, $slides, goTo, slidesLength;
      if (selector == null) {
        selector = '.item';
      }
      goTo = function(index) {
        if (!$screen.data('busy')) {
          $screen.data('busy', true);
          if (index + 1 > slidesLength) {
            index = 0;
          }
          if (index < 0) {
            index = slidesLength - 1;
          }
          $($controls.find('button')[index]).addClass('active').siblings().removeClass('active');
          $($slides[index]).css('z-index', 100).fadeIn(1500);
          setTimeout(function() {
            $($slides[index]).css('z-index', 99).siblings().each(function() {
              return $(this).css('z-index', $(this).data('z-index')).hide();
            });
            return $screen.data('busy', false);
          }, 1500);
          return $screen.data('index', index);
        }
      };
      $screen = $(this);
      $slides = $(this).find(selector);
      slidesLength = $slides.length;
      $screen.data('index', 0).addClass('slideshow-active');
      $slides.css({
        'position': 'absolute',
        'top': 0,
        'right': 0,
        'bottom': 0,
        'left': 0,
        'display': 'block'
      });
      $($slides[$screen.data('index')]).siblings().hide();
      $controls = $('<div class="controls" />');
      $slides.each(function(i) {
        $(this).css('z-index', slidesLength - i).data('z-index', slidesLength - i);
        return $controls.append($('<button class="control" href="#">' + i + '</button>'));
      });
      $controls.find(".control:first-child").addClass("active");
      $screen.after($controls);
      $controls.click(function(e) {
        e.preventDefault();
        return goTo($(e.target).closest('button').index());
      });
      return $(window).on('load resize', function() {
        $screen.css({
          'height': $screen.width() / $screen.find('img').first().getRatio()
        });
        return $slides.css({
          'top': 0,
          'right': 0,
          'bottom': 0,
          'left': 0
        });
      });
    };
  });

}).call(this);
