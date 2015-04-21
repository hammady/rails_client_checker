// checking engine (no need to modify to edit checkers)

var checkers = custom_checkers.reverse()

$(document).ready(function()
{
  var run_engine = function()
  {
    try {
      // run all checkers
      var count = checkers.length
      var errors = 0
      $.each(checkers, function(id, checker){
        // initialize checker display
        checker.div = $(
          "<div class='checker'>" +
            "<span class='display'>Checking "+checker.display+"</span>" +
            "<span class='status'>...</span>" +
            "<div class='error'></div>" +
          "</div>"
        ).prependTo($("#checkers_report"))

        // call worker
        checker.worker(function(error){
          count--
          if (error) {
            errors++
            // show error
            $(".status", checker.div).addClass("no").html("&#215")
            $(".error", checker.div).html(error)
          }
          else {
            // show success
            $(".status", checker.div).addClass("ok").html("&#10004")
          }
          // completion
          if (count == 0) {
            if (errors == 0) {
              // show overall success
              $(".summary.success").show()
            }
            else {
              // show overall errors
              $(".summary.failure").show()
            }
          }
        })
      })
    }
    catch(e) {
      // show engine error
    }
  }

  // add/delete checkers by just pushing object to checkers

  if ($.inArray("pusher", checkers_list) >= 0) {
    checkers.push({
      display: "push connectivity",
      worker: function(callback){
        try {
          var pusher = new Pusher($("#pusher_key").html());
          var channel = pusher.subscribe('test_channel');
          channel.bind('pusher:subscription_succeeded', function() {
            callback(null)
          });
        }
        catch(e) {
          callback(e)
        }
      }
    })
  }

  if ($.inArray("cookies", checkers_list) >= 0) {
    checkers.push({
      display: "cookies",
      worker: function(callback){
        var key = 'test_cookie', val = 'test_value'
        $.ajax({
          url: $("#set_cookie_path").html(),
          data: {
            key: key,
            val: val
          },
          success: function(){
            $.ajax({
              url: $("#get_cookie_path").html(),
              data: {
                key: key
              },
              success: function(data){
                if (data[key] == val)
                  callback(null)
                else
                  callback("Cookies not set correctly")
              },
              error: function(jqXHR, textStatus, errorThrown){
                callback(textStatus + " " + (errorThrown || ""))
              }
            })
          },
          error: function(jqXHR, textStatus, errorThrown){
            callback(textStatus + " " + (errorThrown || ""))
          }
        })
      }
    })
  }

  if ($.inArray("assets", checkers_list) >= 0) {
    checkers.push({
      display: "static assets loading",
      worker: function(callback){
        $.ajax({
          url: $("#dummy_asset_path").html(),
          dataType: "script",
          success: function(){
            if (typeof DUMMY_JS_VARIABLE == 'undefined')
              callback("Content error")
            else
              callback(null)
          },
          error: function(jqXHR, textStatus, errorThrown){
            callback(textStatus + " " + (errorThrown || ""))
          }
        })
      }
    })
  }

  if ($.inArray("browser", checkers_list) >= 0) {
    checkers.push({
      display: "browser compatability",
      worker: function(callback){
        // modern browser check (check http://browser-update.org/customize.html)
        // FF version history: http://en.wikipedia.org/wiki/Firefox_release_history
        // FF 27 official on Feb 2014
        $buo({
          // vs: {f:27},
          reminder: 0,
          reminderClosed: 0,
          newwindow: false,
          onshow: function(op){
            callback("Upgrade your browser")
          },
          onpass: function(){
            callback(null)
          },
          text: ""
        });
      }
    })
  }

  // TODO: SSL checker (SSL assets using AWS CloudFront)

  run_engine()
})
