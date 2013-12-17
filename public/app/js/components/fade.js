(function() {
  $(function() {
    return $.fn.fade = function(selector) {
      var $controls, $screen, $slides, autoTimer, goTo, resetAutoTimer, slidesLength, stopAutoTimer;
      if (selector == null) {
        selector = '.item';
      }
      stopAutoTimer = function() {
        return clearInterval(autoTimer);
      };
      resetAutoTimer = function() {
        var autoTimer;
        clearInterval(autoTimer);
        return autoTimer = setInterval(function() {
          return goTo($screen.data('index') + 1);
        }, 7000);
      };
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
      autoTimer = setInterval(function() {});
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
      return $(this).on('stop', function() {
        return stopAutoTimer();
      });
    };
  });

}).call(this);
