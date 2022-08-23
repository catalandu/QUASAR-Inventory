var blackmoney = false;
var isEngineOn = false;
var talking = false;
var muted = false;
$(document).ready(function() {
    window.addEventListener("message", function(event) { 
        if (event.data.action == "setMoney") {
            setGeld(event.data.money);
            
        };
        if(event.data.action == "setBlackMoney") {
            setBlack(event.data.blackmoney)

            if(event.data.blackmoney >= 0) {
                $("#black_money").show()
                $("#align-self").css("top", "-5px")
            }
        }
        if (event.data.action == "showHud") {
            $('body').show();
        };
        if (event.data.action == "hideHud") {
            $('body').hide();
        };


        if(event.data.action == "hideBlackMoney") {
            $("#black_money").hide()
            $("#align-self").css("top", "20px")
        }

        if (event.data.action == "muted"){
			muted = true
            $(".fa-microphone").css("color", "red")
        };

        if (event.data.action == "nomuted") {
			muted = false
            $(".fa-microphone").css("color", "white")
        };

        if (event.data.action == "togglehud") {
            $('body').fadeToggle()
        }

        if (event.data.action == "setVoiceLevel") {
            if (event.data.level == 1) {
                $("#innerdiv").css("width", "23%")
            } else if (event.data.level == 2) {
                $("#innerdiv").css("width", "50%")
            } else if (event.data.level == 3) {
                $("#innerdiv").css("width", "95%")
            }
        };
        if (event.data.action == "setFunk") {
            if (event.data.val) {
                $(".fa-walkie-talkie").css("color", "rgb(216, 159, 1)");

            } else {
				$(".fa-walkie-talkie").css("color", "white");
            }
        };

        if (event.data.action == "setVoiceTalking") {
			if(event.data.val) {
				talking = true
				$(".fa-microphone").css("color", "#FF6E6E")
			} else {
				talking = false
				if(muted) {
					return
				}
				$(".fa-microphone").css("color", "white")
			}
        }
    });
});

function setGeld(anzahl) {
    document.getElementById("cash").innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + "$";

}

function setBlack(anzahl2) {
    console.log(anzahl2)
    document.getElementById("black_money").innerHTML = new Intl.NumberFormat('de-DE').format(anzahl2) + "$";

}