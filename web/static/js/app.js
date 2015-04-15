import {Socket} from "phoenix"

class App {

  static init(){
    var $messages = $("#messages")
    var $add = $("#add")
    var $tz = $("#tz")

    let socket = new Socket("/ws")
    socket.connect()

    let callback = function (chan) {
      chan.onError(function (e) {
        return console.log("something went wrong", e);
      });
      chan.onClose(function (e) {
        return console.log("channel closed", e);
      });
      chan.on("time:update", setTime);
    };

    let setTime = function (msg) {
      var tz = msg.tz

      //Set seconds
      var seconds = msg.secs;
      var sdegree = seconds * 6;
      var srotate = "rotate(" + sdegree + "deg)";
      var clock = $("#"+tz);

      clock.find(".sec").css({"-moz-transform" : srotate, "-webkit-transform" : srotate});

      //Set Hours
      var hours = msg.hours;
      var mins = msg.mins;
      var hdegree = hours * 30 + (mins / 2);
      var hrotate = "rotate(" + hdegree + "deg)";
      clock.find(".hour").css({"-moz-transform" : hrotate, "-webkit-transform" : hrotate});

      //Set Minutes
      var mdegree = mins * 6;
      var mrotate = "rotate(" + mdegree + "deg)";
      clock.find(".min").css({"-moz-transform" : mrotate, "-webkit-transform" : mrotate});

    };

    let registerClock = function(tz) {
      socket.join("currenttime:"+tz, {}).receive("ignore", function () {
        return console.log("auth error");
      }).receive("ok", callback).after(10000, function () {
        return console.log("Connection interruption");
      });
    };


    $add.on("click", e => {
      var tz = $tz.val();

      var el = {
          div: $("<div>", {class: "col-sm-4"}),
          h1: $("<h1>", {class: "text-center"}),
          ul: $("<ul>", {class: "clock", id: tz}),
          liSec: $("<li>", {class: "sec"}),
          liHour: $("<li>", {class: "hour"}),
          liMin: $("<li>", {class: "min"})
      };
      el.h1.text(tz);

      el.liSec.appendTo(el.ul);
      el.liHour.appendTo(el.ul);
      el.liMin.appendTo(el.ul);
      el.h1.appendTo(el.div);
      el.ul.appendTo(el.div);
      el.div.appendTo($("#clocks"));

      registerClock(tz);
    })

  }
}

$( () => App.init() )

export default App
