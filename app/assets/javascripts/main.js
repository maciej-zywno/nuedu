$(document).on('ready page:load', function () {
  $(document).ready(function () {
      $('.eacc-change-photo-btn').bind('click', function () {
          $('#eacc-change-photo-file').click();
          return false;
      });
      $('.icon-menu').on('click', function () {
          var is_active = $('#main-menu').hasClass('active');
          if (is_active) {
              $('#main-menu').slideUp();
              $('#main-menu').removeClass('active');
          } else {
              $('#main-menu').slideDown();
              $('#main-menu').addClass('active');
          }
      });
      $('#name-field').blur(function () {
          var value = $('#name-field').val();
          if (value) {
              $('.hello').html('miło Cię poznać!');
          } else {
              $('.hello').empty();
          }
      });
      $('.login').on('click', function (event) {
          var is_open = $('.auth-form-wrapper').hasClass('open');
          if (!is_open) {
              $('.auth-login-wrapper').addClass('open');
              fullscreenlogin('.auth-login-wrapper');
          }
          event.preventDefault();
      });
      $('.close-login').on('click', function () {
          $('.auth-login-wrapper').removeClass('open');
      })
  });
  function fullscreenlogin(element) {
      var windowheight = $(window).height();
      $(element).css('height', windowheight);
      $(element).css('height', "touch");
      var loginwrapperheight = $('.login-form-wrapper').outerHeight();
      if (windowheight > loginwrapperheight) {
          $('.login-form-wrapper').css('margin-top', (windowheight - loginwrapperheight) / 2);
      }
  }
});
