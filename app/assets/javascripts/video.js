
      // This function is called when an error is thrown by the player
      function onPlayerError(errorCode) {
        alert("An error occured of type:" + errorCode);
      }
      // This function is called when the player changes state
      function onPlayerStateChange(newState) {
        if(newState == 0){
          var video_id = $('.f-player').data('video_id');
          var step_id = $('.f-player').data('step_id');
          var course_id = $('.f-player').data('course_id');

          $.ajax({
            type: "GET",
            url: "/courses/"+course_id+"/steps/"+step_id+"/videos/"+video_id+"/finish",
            dataType: "script"
          }).done(function() {
            // alert( "success" );
          })
          .fail(function() {
            alert( "error" );
          })
          .always(function() {
            // alert( "complete" );
          });

        }
      }
      // This function is automatically called by the player once it loads
      function onYouTubePlayerReady(playerId) {
        ytplayer = document.getElementById("ytPlayer");
        ytplayer.addEventListener("onStateChange", "onPlayerStateChange");
        ytplayer.addEventListener("onError", "onPlayerError");
        ytPlayer.playVideo();
      }

      // The "main method" of this sample. Called when someone clicks "Run".
      function loadPlayer(videoID) {
        // Lets Flash from another domain call JavaScript
        var params = { allowScriptAccess: "always",
          allowFullScreen: 'true'
           };
        // The element id of the Flash embed
        var atts = { id: "ytPlayer" };
        // All of the magic handled by SWFObject (http://code.google.com/p/swfobject/)
        swfobject.embedSWF("http://www.youtube.com/v/" + videoID + 
                           "?version=3&enablejsapi=1&playerapiid=player1&fs=1&modestbranding=1&rel=0&showinfo=0&iv_load_policy=3&version=3", 
                           "videoDiv", "860", "600", "9", null, null, params, atts);
      }

