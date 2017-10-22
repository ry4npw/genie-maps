#debug 5
# Script to Travel #
# Written by Chris/Achilles #
# Requires EXP Plugin by VTCifer #
# If you are calling this script via another, use ^YOU ARRIVED! to match the end of travelling!
#
##########################################
#                                        #
#       ADJUSTABLE VARIABLES             #
#                                        #
##########################################
##   ADJUST THE RANKS BELOW TO YOUR     ##
##       PARTICULAR CHARACTER           ##
##   THESE ARE CONSERVATIVE ESTIMATES   ##
##                                      ##
##  If you are joined in a group,       ##
##  You will take public transportation ##
##                                      ##
##########################################
##########################################
##                                      ##
##  ARE YOU A SHARD CITIZEN?            ##
##   yes OR no                          ##
    var shardcitizen yes
##                                      ##
##########################################
##    RANKS TO USE THE ROSSMAN'S        ##
##          SHORTCUT                    ##
## NORTH
    var rossmannorth 200
## SOUTH
    var rossmansouth 125
##                                      ##
##########################################
##    RANKS TO USE THE FALDESU          ##
    var faldesu 200
##########################################
##    RANKS TO USE THE SEGOLTHA         ##
    var segoltha 550
##########################################
##    RANKS TO USE UNDER-GONDOLA        ##
    var undergondola 550
##########################################
##########################################
##    RANKS TO USE UNDER-SEGOLTHA(THIEF)##
    var undersegoltha 65
##########################################
TOP:
if "shardcitizen" = "yes" then
     {
          #put #trigger {^The gate is closed\.  Try KNOCKing instead\.} {knock gate}
          #put #trigger {^The gate is wide open\.  You can just go through\!} {go gate}
          #put #trigger save
          # SAVED FOR POSTERITY, NOW HANDLED BY AUTOMAPPER
     }
timer clear
timer start
if $joined = 1 then
     {
          var rossmannorth 2000
          var rossmansouth 2000
          var faldesu 2000
          var segoltha 2000
          var undergondola 2000
          var undersegoltha 2000
          var shardcitizen no
          Echo ### You are in a group!  You will NOT be taking the gravy short cuts today! ###
     }
action put fatigue when ^You can see a ferry approaching on the left side.|^The ferry|^A kingfisher|^A burst of|^The Elven|^The skiff|^The polemen|^Small waves|^The sturdy stone|^You are about a fourth of the way across\.|^The ferry moves away\, nearly out of view\.|ferry passing you on the left\.|^You are nearing the docks\.|^A swarm of eels passes beneath the keel\, probably on their way to the river\'s fresh water to spawn\.|followed by the clatter of wood on wood\.|^A family of dolphins leaps from the water beside the galley\.|^Some geese in a perfect V fly north high overhead\.|^Some small blue sharks slide past through the water\.|^A sailor walks by with a coil of rope\.|^A green turtle as large as a tower shield swims past\,|^You are nearing the docks\.|A drumbeat sounds through the ship\.|^You are about a fourth of the way across\.|^A galley comes into sight\, its oars beating rhythmically\.|^The galley moves away\, the beat of its drum slowly fading\.|^For a few minutes\, the drumbeat from below is echoed across the water by the beat from the galley passing on the left\.|The door swings shut of its own accord, and the gondola pushes off\.|The platform vanishes against the ridgeline\.|The gondola arrives at the center of the chasm\, and keeps heading (north|south)\.|The cab trundles on along as the ropes overhead creak and moan\.|The ropes creak as the gondola continues (north|south)\.|^The gondola creaks as a wind pushes it back and forth\.|^You hear a bell ring out three times|^The barge|^Several oars pull|^All that is visible|^The opposite bank|^A few of the other passengers|^The shore disappears
action put look when ^Your destination
action goto NOCOIN when ^\"Hey\,\" he says\, \"You haven\'t
action put #var Guild $1 when Guild\: (\S+)
action put #var Circle $1 when Circle\: (\d+)
action var kronars 0 when No Kronars\.
action var kronars $1 when \((\d*) copper Kronars\)\.
action var lirums 0 when No Lirums\.
action var lirums $1 when \((\d*) copper Lirums\)\.
action var dokoras 0 when No Dokoras\.
action var dokoras $1 when \((\d*) copper Dokoras\)\.
var kronars 0
var dokoras 0
var lirums 0
var destination %1
var detour nil
put #mapper reset
pause 0.5
send info
wait
send exp 0
wait
put #var save
if "%destination" = "" then goto nodestination
if ("$zoneid" = "0") || ("$roomid" = "0") then 
     {
          echo ### Unknown map or room id - Attempting to move in random direction to recover
          gosub MOVE_RANDOM
     }
pause 0.1
if ("$zoneid" = "0") || ("$roomid" = "0") then gosub MOVE_RANDOM
pause 0.1
if "$zoneid" = "0" then 
     {
          ECHO ### You are in a spot not recognized by Genie, please start somewhere else! ###
          exit
     }
#DESTINATION
if matchre("(cro|cros|cross|crossi|crossin|crossing|crossings)","%1") then goto CROSSING
if matchre("(wol|wolf|wolfc|wolfcl|wolfcla|wolfclan)","%destination") then
     {
          var detour wolf
          goto CROSSING
     }
if matchre("(kni|knif|knife|knifec|knifecl|knifecla|knifeclan)","%destination") then
     {
          var detour knife
          goto CROSSING
     }
if matchre("(tig|tige|tiger|tigerc|tigercl|tigercla|tigerclan)","%destination") then
     {
          var detour tiger
          goto CROSSING
     }
if matchre("(dir|dirg|dirge)","%destination") then
     {
          var detour dirge
          goto CROSSING
     }
if matchre("(art|arth|arthe|arthed|artheda|arthedal|arthedale)","%destination") then
     {
          var detour arthe
          goto CROSSING
     }
if matchre("(kae|kaer|kaern|kaerna)","%destination") then
     {
          var detour kaerna
          goto CROSSING
     }
if matchre("(ila|ilay|ilaya|ilayat|ilayata|ilayatai|ilayataip|ilayataipa|tai|taip|taipa)","%destination") then
     {
          var detour taipa
          goto CROSSING
     }
if matchre("(let|leth|lethd|lethde|lethder|lethderi|lethderie|lethderiel)","%destination") then
     {
          var detour leth
          goto CROSSING
     }
if matchre("(ace|acen|acena|acenam|acenama|acenamac|acenamacr|acenamacra)","%destination") then
     {
          var detour acen
          goto CROSSING
     }
if matchre("(vip|vipe|viper|vipers|gua|guard|guardi|guardia|guardian|guardians|leu|leuc|leucr|leucro|leucros)","%destination") then
     {
          var detour viper
          goto CROSSING
     }
if matchre("(sor|sorr|sorro|sorrow|sorrows)","%destination") then
     {
          var detour sorrow
          goto CROSSING
     }
if matchre("(mis|mise|misen|misens|misense|misenseo|misenseor)","%destination") then
     {
          var detour misen
          goto CROSSING
     }
if matchre("(sto|ston|stone)","%destination") then
     {
          var detour stone
          goto CROSSING
     }
if matchre("(sha|shar|shard)","%destination") then goto ILITHI
if matchre("(spi|spir|spire)","%destination") then
     {
          var detour spire
          goto ILITHI
     }
if matchre("(hor|hors|horse)","%destination") then
     {
          var detour horse
          goto ILITHI
     }
if matchre("(fay|fayr|fayri|fayrin|fayrin'|fayrin's)","%destination") then
     {
          var detour fayrin
          goto ILITHI
     }
if matchre("(ste|stee|steel|steelc|steelcl|steelcla|steelclaw)","%destination") then
     {
          var detour steel
          goto ILITHI
     }
if matchre("(cor|cori|corik|corik'|corik's)","%destination") then
     {
          var detour corik
          goto ILITHI
     }
if matchre("(ada|adan|adan'|adan'f)","%destination") then
     {
          var detour adan'f
          goto ILITHI
     }
if matchre("(ylo|ylon|ylono)","%destination") then
     {
          var detour ylono
          goto ILITHI
     }
if matchre("(riv|rive|river|riverh|riverha|riverhav|riverhave|riverhaven|hav|have|haven)","%destination") then
     {
          var detour haven
          goto THERENGIA
     }
if matchre("(ros|ross|rossm|rossma|rossman|rossmans)","%destination") then
     {
          var detour rossman
          goto THERENGIA
     }
if matchre("(the|ther|there|theren|therenb|therenbo|therenbor|therenborou|therenboroug|therenborough)","%destination") then
     {
          var detour theren
          goto THERENGIA
     }
if matchre("(lan|lang|lange|langen|langenf|langenfi|langenfir|langenfirt|langenfirth)","%destination") then
     {
          var detour lang
          goto THERENGIA
     }
if matchre("(rak|raka|rakas|rakash)","%destination") then
     {
          var detour rakash
          goto THERENGIA
     }
if matchre("(mus|musp|muspa|muspar|muspari)","%destination") then
     {
          var detour muspari
          goto THERENGIA
     }
if matchre("(forn|forns|fornst|fornste|fornsted)","%destination") then
     {
          var detour fornsted
          goto THERENGIA
     }
if matchre("(zau|zaul|zaulf|zaulfu|zaulfun|zaulfung)","%destination") then
     {
          var detour zaulfung
          goto THERENGIA
     }
if matchre("(ain|aing|aingh|aingha|ainghaz|ainghaza|ainghazal)","%destination") then
     {
          var detour ain
          goto FORD
     }
if matchre("(rav|rave|raven'|raven's)","%destination") then
     {
          var detour raven
          goto FORD
     }
if matchre("(out|oute|outer|hib|hiba|hibar|hibarn|hibarnh|hibarnhv|hibarnhvi|hibarnhvid|hibarnhvida|hibarnhvidar|hibble|hibbles|hibheigh|hibdjfekbhr|hibarvhigdladrwfws)","%destination") then
     {
          var detour outer
          goto FORD
     }
if matchre("(inn|inne|inner)","%destination") then
     {
          var detour inner
          goto FORD
     }
if matchre("(boa|boar)","%destination") then goto FORD
goto nodestination
  
# TRAVEL
CROSSING:
  var label CROSSING
  if "$zoneid" = "41" then gosub MOVE 53
  if "$zoneid" = "42" then gosub MOVE 2
  if "$zoneid" = "59" then gosub MOVE 12
  if "$zoneid" = "114" then
            {
                if %dokoras < 60 then goto NOCOIN
                gosub MOVE 1
                gosub FERRYLOGIC
                send go oak doors
            }
  if "$zoneid" = "40a" then gosub MOVE 125
  if "$zoneid" = "40" && $Athletics.Ranks >= %rossmansouth then gosub MOVE 213
  if "$zoneid" = "40" && $Athletics.Ranks < %rossmansouth then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 36
                gosub FERRYLOGIC
            }
  if "$zoneid" = "34a" then gosub MOVE 134
  if "$zoneid" = "34" then gosub MOVE 15
  if "$zoneid" = "33a" then gosub MOVE 46
  if "$zoneid" = "33" then gosub MOVE 1
  if "$zoneid" = "32" then gosub MOVE 1
  if "$zoneid" = "31" then gosub MOVE 1
  if "$zoneid" = "30" && $Athletics.Ranks < %faldesu then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 103
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "30" && $Athletics.Ranks >= %faldesu then
            {
                gosub MOVE 203
                gosub MOVE 79
            }
  if "$zoneid" = "14c" then gosub MOVE 21
  if "$zoneid" = "127" then gosub MOVE 510
  if "$zoneid" = "126" then gosub MOVE 49
  if "$zoneid" = "116" then gosub MOVE 3
  if "$zoneid" = "123" then gosub MOVE 175
  if "$zoneid" = "69" then gosub MOVE 1
  if "$zoneid" = "68a" then gosub MOVE 29
  if "$zoneid" = "68b" then gosub MOVE 44
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub MOVE 15
  if "$zoneid" = "68" && %shardcitizen = "yes" then
            {
                gosub MOVE 1
                gosub MOVE 135
            }
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub MOVE 15
  if "$zoneid" = "67" && "$guild" = "Thief" then
            {
                gosub MOVE 566
                gosub MOVE 23
            }
  if "$zoneid" = "67" then gosub MOVE 132
  if "$zoneid" = "66" && $Athletics.Ranks >= %undergondola then gosub MOVE 317
  if "$zoneid" = "66" && $Athletics.Ranks < %undergondola then
            {
                gosub MOVE 156
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "63" then gosub MOVE 112
  if "$zoneid" = "65" then gosub MOVE 44
  if "$zoneid" = "62" then gosub MOVE 100
  if "$zoneid" = "112" then gosub MOVE 112
  if "$zoneid" = "58" then gosub MOVE 2
  if "$zoneid" = "60" && matchre("(leth|acen|taipa)","%detour") then gosub MOVE 57
  if "$zoneid" = "61" && matchre("(leth|acen|taipa)","%detour") then
            {
                if "%detour" = "acen" then
                    {
                        gosub MOVE 178
                        gosub MOVE 47
                    }
                if "%detour" = "taipa" then
                    {
                        gosub MOVE 126
                        gosub MOVE 27
                    }
                if "%detour" = "leth" then gosub MOVE 18
                goto ARRIVED
            }
  if "$zoneid" = "61" then gosub MOVE 115
  if "$zoneid" = "60" && "$Guild" = "Thief" then
            {
                if $Athletics.Ranks >= %undersegoltha then
                    {
                        gosub MOVE 107
                        gosub MOVE 6
                    }
            }
  if "$zoneid" = "60" && $Athletics.Ranks >= %segoltha then gosub MOVE 108
  if "$zoneid" = "60" && $Athletics.Ranks < %segoltha then
            {
                if %kronars < 40 then goto NOCOIN
                gosub MOVE 42
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "50" then gosub MOVE 8
  if "$zoneid" = "4a" then gosub MOVE 15
  if "$zoneid" = "4b" then gosub MOVE 1
  if "$zoneid" = "4" then gosub MOVE 14
  if "$zoneid" = "13" then gosub MOVE 71
  if "$zoneid" = "12a" then gosub MOVE 60
  if "$zoneid" = "10" then gosub MOVE 116
  if "$zoneid" = "9b" then gosub MOVE 9
  if "$zoneid" = "14b" then gosub MOVE 217
  if "$zoneid" = "11" then gosub MOVE 2
  if "$zoneid" = "1" && matchre("(arthe|dirge|kaerna|stone|misen|sorrow|fist)","%detour") then gosub MOVE 171
  if "$zoneid" = "7" && matchre("(arthe|dirge|kaerna|stone|misen|sorrow|fist)","%detour") then
            {
                if "%detour" = "dirge" then
                    {
                        gosub MOVE 147
                        gosub MOVE 38
                    }
                if "%detour" = "arthe" then gosub MOVE 535
                if "%detour" = "kaerna" then gosub MOVE 352
                if "%detour" = "stone" then gosub MOVE 396
                if "%detour" = "fist" then gosub MOVE 253
                if "%detour" = "misen" then gosub MOVE 437
                if "%detour" = "viper" then
                    {
                        gosub MOVE 394
                        if $Perception.Ranks > 150 then gosub MOVE 5
                    }
                if "%detour" = "sorrow" then 
                    {
                        gosub MOVE 397
                        gosub MOVE 77
                    }
                goto ARRIVED
            }
  if "$zoneid" = "7" then gosub MOVE 349
  if "$zoneid" = "8" then gosub MOVE 43
  if "$zoneid" = "1" && matchre("(wolf|knife|tiger)","%detour") then
            {
                gosub MOVE 172
                if "%detour" = "wolf" then gosub MOVE 126
                if "%detour" = "knife" then gosub MOVE 459
                if "%detour" = "tiger" then gosub MOVE 87
                goto ARRIVED
            }
  if "$zoneid" = "1" && matchre("(leth|acen|taipa)","%detour") then
            {
                if "$Guild" = "Thief" then
                    {
                        if $Athletics.Ranks >= %undersegoltha then
                            {
                                gosub MOVE 650
                                gosub MOVE 23
                            }
                    }
                if $Athletics.Ranks >= %segoltha && "$zoneid" = "1" then
                    {
                        gosub MOVE 476
                        gosub MOVE 30
                    }
                if "$zoneid" = "1" then 
                    {
                        if %kronars < 40 then goto NOCOIN
                        gosub MOVE 236
                        gosub FERRYLOGIC
                    }
                pause
                put south
                wait
                put #mapper reset
                gosub MOVE 57
                if "%detour" = "acen" then
                    {
                        gosub MOVE 178
                        gosub MOVE 47
                    }
                if "%detour" = "taipa" then
                    {
                        gosub MOVE 126
                        gosub MOVE 27
                    }
                if "%detour" = "leth" then gosub MOVE 18
            }
  if "$zoneid" = "1" then gosub MOVE 231
  goto ARRIVED

ILITHI:
  var label ILITHI
  #debug 10
  if "$zoneid" = "127" then gosub MOVE 510
  if "$zoneid" = "126" then gosub MOVE 49
  if "$zoneid" = "116" then gosub MOVE 3
  if "$zoneid" = "114" then
            {
                if %dokoras < 60 then goto NOCOIN
                gosub MOVE 4
                gosub FERRYLOGIC
                send west
                wait
            }
  if "$zoneid" = "123" then gosub MOVE 175
  if "$zoneid" = "41" then gosub MOVE 53
  if "$zoneid" = "42" then gosub MOVE 2
  if "$zoneid" = "59" then gosub MOVE 12
  if "$zoneid" = "114" then
            {
                if %dokoras < 60 then goto NOCOIN
                gosub MOVE 1
                gosub FERRYLOGIC
                send go oak doors
            }
  if "$zoneid" = "40a" then gosub MOVE 125
  if "$zoneid" = "40" && $Athletics.Ranks >= %rossmansouth then gosub MOVE 213
  if "$zoneid" = "40" && $Athletics.Ranks < %rossmansouth then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 36
                gosub FERRYLOGIC
            }
  if "$zoneid" = "34a" then gosub MOVE 134
  if "$zoneid" = "34" then gosub MOVE 15
  if "$zoneid" = "33a" then gosub MOVE 46
  if "$zoneid" = "33" then gosub MOVE 1
  if "$zoneid" = "32" then gosub MOVE 1
  if "$zoneid" = "31" then gosub MOVE 1
  if "$zoneid" = "30" && $Athletics.Ranks < %faldesu then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 103
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "30" && $Athletics.Ranks >= %faldesu then
            {
                gosub MOVE 203
                gosub MOVE 79
            }
  if "$zoneid" = "14c" then gosub MOVE 21
  if "$zoneid" = "13" then gosub MOVE 71
  if "$zoneid" = "12a" then gosub MOVE 60
  if "$zoneid" = "4a" then gosub MOVE 15
  if "$zoneid" = "4" then gosub MOVE 14
  if "$zoneid" = "8" then gosub MOVE 43
  if "$zoneid" = "10" then gosub MOVE 116
  if "$zoneid" = "9b" then gosub MOVE 9
  if "$zoneid" = "14b" then gosub MOVE 217
  if "$zoneid" = "11" then gosub MOVE 2
  if "$zoneid" = "7" then gosub MOVE 349
  if "$zoneid" = "1" then
            {
                if "$Guild" = "Thief" then
                    {
                        if $Athletics.Ranks >= %undersegoltha then
                            {
                                gosub MOVE 650
                                gosub MOVE 23
                            }
                    }
                if $Athletics.Ranks >= %segoltha && "$zoneid" = "1" then
                    {
                        gosub MOVE 476
                        gosub MOVE 30
                    }
                if "$zoneid" = "1" then 
                    {
                        if %kronars < 40 then goto NOCOIN
                        gosub MOVE 236
                        gosub FERRYLOGIC
                    }
                pause
                put south
                wait
                put #mapper reset
            }
  if "$zoneid" = "60" then gosub MOVE 57
  if "$zoneid" = "112" then gosub MOVE 112
  if "$zoneid" = "59" then gosub MOVE 12
  if "$zoneid" = "58" then gosub MOVE 2
  if "$zoneid" = "61" then gosub MOVE 130
  if "$zoneid" = "63" then gosub MOVE 112
  if "$zoneid" = "62" && $Athletics.Ranks >= %undergondola then gosub MOVE 153
  if "$zoneid" = "62" then 
            {
                gosub MOVE 2
                gosub FERRYLOGIC
            }
  if "$zoneid" = "69" && matchre("(horse|spire)","%detour") then
            {
                if "%detour" = "horse" then gosub MOVE 199
                if "%detour" = "spire" then gosub MOVE 334
                goto ARRIVED
            }
  if "$zoneid" = "65" then gosub MOVE 1
  #if "$zoneid" = "69" && "%shardcitizen" = "yes" then gosub MOVE 31
  if "$zoneid" = "69" then gosub MOVE 1
  if "$zoneid" = "68" && matchre("(adan'f|corik)","%detour") then
            {
                if "%detour" = "corik" then gosub MOVE 114
                if "%detour" = "adan'f" then gosub MOVE 29
                goto ARRIVED
            }
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub MOVE 225
  if "$zoneid" = "68" && %shardcitizen = "yes" then gosub MOVE 1
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub MOVE 15
  if "$zoneid" = "67" && "$guild" = "Thief" && matchre("(steel|ylono|fayrin|horse|spire)","%detour") then
            {
                gosub MOVE 566
                gosub MOVE 23
            }
  if "$zoneid" = "67" && "$guild" = "Thief" && matchre("(adan'f|corik)","%detour") then
            {
                gosub MOVE 228
                pause
                send climb embrasure
                wait
                if "%detour" = "adan'f" then gosub MOVE 29
                if "%detour" = "corik" then gosub MOVE 114
            }
  if "$zoneid" = "67" && matchre("(steel|ylono|fayrin|horse|spire|corik|adan'f)","%detour") then gosub MOVE 132
  if "$zoneid" = "66" && matchre("(steel|fayrin|ylono|corik|adan'f)","%detour") then
            {
                if "%detour" = "steel" then gosub MOVE 99
                if "%detour" = "fayrin" then gosub MOVE 127
                if "%detour" = "ylono" then gosub MOVE 495
                if matchre("(corik|adan'f)","%detour") then
                    {
                        if "$guild" = "Thief" then
                            {
                                gosub MOVE 617
                                gosub MOVE 19
                                gosub MOVE 228
                                pause
                                send climb embrasure
                                wait
                            }
                        if "%shardcitizen" = "yes" && "$zoneid" = 66 then
                            {
                                gosub MOVE 216
                                gosub MOVE 230
                            }
                        if "$zoneid" = "66" then gosub MOVE 3
                        if "%detour" = "adan'f" then gosub MOVE 29
                        if "%detour" = "corik" then gosub MOVE 114
                    }
                goto ARRIVED
            }
  if "$zoneid" = "66" && matchre("(horse|spire)","%detour") then
            {
                gosub MOVE 217
                if "%detour" = "horse" then gosub MOVE 199
                if "%detour" = "spire" then gosub MOVE 334
            }
  if "$zoneid" = "66" && "$guild" = "Thief" then
            {
                gosub MOVE 617
                gosub MOVE 19
            }
  if "$zoneid" = "66" then gosub MOVE 216
  if "$zoneid" = "67" then gosub MOVE 145
  goto ARRIVED
THERENGIA:
  var label THERENGIA
  #debug 10
  if "$zoneid" = "127" then gosub MOVE 510
  if "$zoneid" = "126" then gosub MOVE 49
  if "$zoneid" = "116" then gosub MOVE 3
  if "$zoneid" = "114" then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 1
                gosub FERRYLOGIC
                put go oak doors
                waitforre ^Obvious
            }
  if "$zoneid" = "123" then gosub MOVE 175
  if "$zoneid" = "69" then gosub MOVE 1
  if "$zoneid" = "68a" then gosub MOVE 29
  if "$zoneid" = "68b" then gosub MOVE 44
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub MOVE 15
  if "$zoneid" = "68" && %shardcitizen = "yes" then
            {
                gosub MOVE 1
                gosub MOVE 135
            }
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub MOVE 15
  if "$zoneid" = "67" && "$guild" = "Thief" then
            {
                gosub MOVE 566
                gosub MOVE 23
            }
  if "$zoneid" = "67" then gosub MOVE 132
  if "$zoneid" = "66" && $Athletics.Ranks >= %undergondola then gosub MOVE 317
  if "$zoneid" = "66" && $Athletics.Ranks < %undergondola then
            {
                gosub MOVE 156
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "65" then gosub MOVE 44
  if "$zoneid" = "63" then gosub MOVE 112
  if "$zoneid" = "62" then gosub MOVE 100
  if "$zoneid" = "112" then gosub MOVE 112
  if "$zoneid" = "59" then gosub MOVE 12
  if "$zoneid" = "58" then gosub MOVE 2
  if "$zoneid" = "61" then gosub MOVE 115
  if "$zoneid" = "60" && "$Guild" = "Thief" then
            {
                if $Athletics.Ranks >= %undersegoltha then
                    {
                        gosub MOVE 107
                        gosub MOVE 6
                    }
            }
  if "$zoneid" = "60" && $Athletics.Ranks >= %segoltha then gosub MOVE 108
  if "$zoneid" = "60" && $Athletics.Ranks < %segoltha then
            {
                if %kronars < 40 then goto NOCOIN
                gosub MOVE 42
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "50" then gosub MOVE 8
  if "$zoneid" = "13" then gosub MOVE 71
  if "$zoneid" = "4a" then gosub MOVE 15
  if "$zoneid" = "4" then gosub MOVE 14
  if "$zoneid" = "8" then gosub MOVE 43
  if "$zoneid" = "10" then gosub MOVE 22
  if "$zoneid" = "9b" then gosub MOVE 9
  if "$zoneid" = "14b" then gosub MOVE 217
  if "$zoneid" = "11" then gosub MOVE 2
  if "$zoneid" = "1" then gosub MOVE 171
  if "$zoneid" = "7" && $Athletics.Ranks >= %faldesu then gosub MOVE 197
  if "$zoneid" = "7" && $Athletics.Ranks < %faldesu then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 81
                gosub FERRYLOGIC
            }
  if "$zoneid" = "14c" then gosub MOVE 22
  if "$zoneid" = "33a" then gosub MOVE 46
  if "$zoneid" = "33" then gosub MOVE 1
  if "$zoneid" = "31" && "%detour" = "zaulfung" then gosub MOVE 100
  if "$zoneid" = "31" then gosub MOVE 1
  if "$zoneid" = "34a" && "%detour" != "rossman" then gosub MOVE 145
  if "$zoneid" = "34" && "%detour" = "rossman" then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 22
                goto ARRIVED
            }
  if "$zoneid" = "34" && matchre("(lang|theren|rakash|muspari|fornsted|el'bain)","%detour") then gosub MOVE 137
  if "$zoneid" = "34" && matchre("(haven|zaulfung)","%detour") then
            {
                if $Athletics.Ranks < %rossmansouth then gosub MOVE 137
                if $Athletics.Ranks >= %rossmansouth then
                    {
                        gosub MOVE 15
                        gosub MOVE 46
                        gosub MOVE 1
                    }
            }
  if "$zoneid" = "41" then if matchre("(muspari|fornsted)","%detour") then
            {
                if matchre("(muspari|fornsted)","%detour") then
                    {
                        gosub MOVE 85
                        goto ARRIVED
                    }
                else gosub MOVE 53
            }
  if "$zoneid" = "30" && matchre("(rossman|lang|theren|rakash|muspari|fornsted|el'bain)","%detour") then
            {
                if $Athletics.Ranks < %rossmannorth then
                    {
                        if %lirums < 70 then goto NOCOIN
                        gosub MOVE 99
                        gosub FERRYLOGIC
                    }
                if $Athletics.Ranks >= %rossmannorth then
                    {
                        gosub MOVE 174
                        gosub MOVE 29
                        gosub MOVE 48
                        if "%detour" = "rossman" then
                            {
                                gosub MOVE 22
                                goto ARRIVED
                            }
                        gosub MOVE 137
                    }
            }
  if "$zoneid" = "40a" then gosub MOVE 125
  if "$zoneid" = "42" && "%detour" != "theren" then gosub MOVE 2
  if "$zoneid" = "40" && "%detour" = "rossman" then
            {
                gosub MOVE 213
                gosub MOVE 22
                goto ARRIVED
            }
  if "$zoneid" = "40" && matchre("(lang|rakash|el'bain)","%detour") then
            {
                if "%detour" = "el'bain" then
                    {
                        gosub MOVE 142
                        goto ARRIVED
                    }
                if "%detour" = "lang" then
                    {
                        gosub MOVE 1
                        goto ARRIVED
                    }
                if "%detour" = "rakash" then
                    {
                        gosub MOVE 263
                        gosub MOVE 96
                        goto ARRIVED
                    }
            }
  if "$zoneid" = "40" && matchre("(haven|zaulfung)","%detour") then
            {
                if $Athletics.Ranks >= %rossmansouth then 
                    {
                        gosub MOVE 213
                        gosub MOVE 15
                        gosub MOVE 46
                        gosub MOVE 1
                    }
                if $Athletics.Ranks < %rossmansouth then
                    {
                        if %lirums < 70 then goto NOCOIN
                        gosub MOVE 36
                        gosub FERRYLOGIC
                    }
            }
  if "$zoneid" = "40" && "%detour" = "theren" then gosub MOVE 211
  if "$zoneid" = "42" && "%detour" = "theren" then
            {
                gosub MOVE 56
                goto ARRIVED
            }
  if "$zoneid" = "40" && matchre("(muspari|fornsted)","%detour") then
            {
                gosub MOVE 376
                gosub MOVE 85
                goto ARRIVED
            }
  if "$zoneid" = "30" && "%detour" = "zaulfung" then
            {
                gosub MOVE 203
                gosub MOVE 100
            }
  if "$zoneid" = "30" then
            {
                gosub MOVE 8
                goto ARRIVED
            }
  goto ARRIVED
FORD:
  var label FORD
  #debug 10
  if "$zoneid" = "41" then gosub MOVE 53
  if "$zoneid" = "40a" then gosub MOVE 125
  if "$zoneid" = "42" then gosub MOVE 2
  if "$zoneid" = "40" && $Athletics.Ranks >= %rossmansouth then gosub MOVE 213
  if "$zoneid" = "40" && $Athletics.Ranks < %rossmansouth then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 36
                gosub FERRYLOGIC
            }
  if "$zoneid" = "34a" then gosub MOVE 134
  if "$zoneid" = "34" then gosub MOVE 15
  if "$zoneid" = "33a" then gosub MOVE 46
  if "$zoneid" = "33" then gosub MOVE 1
  if "$zoneid" = "32" then gosub MOVE 1
  if "$zoneid" = "31" then gosub MOVE 1
  if "$zoneid" = "30" && $Athletics.Ranks < %faldesu then
            {
                if %lirums < 70 then goto NOCOIN
                gosub MOVE 103
                pause
                gosub FERRYLOGIC
            }
  if "$zoneid" = "30" && $Athletics.Ranks >= %faldesu then
            {
                gosub MOVE 203
                gosub MOVE 79
            }
  if "$zoneid" = "14c" then gosub MOVE 21
  if "$zoneid" = "13" then gosub MOVE 71
  if "$zoneid" = "4a" then gosub MOVE 15
  if "$zoneid" = "4" then gosub MOVE 14
  if "$zoneid" = "8" then gosub MOVE 43
  if "$zoneid" = "10" then gosub MOVE 22
  if "$zoneid" = "9b" then gosub MOVE 9
  if "$zoneid" = "14b" then gosub MOVE 217
  if "$zoneid" = "11" then gosub MOVE 2
  if "$zoneid" = "7" then gosub MOVE 349
  if "$zoneid" = "1" then
            {
                if "$Guild" = "Thief" then
                    {
                        if $Athletics.Ranks >= %undersegoltha then
                            {
                                gosub MOVE 650
                                gosub MOVE 23
                            }
                    }
                if $Athletics.Ranks >= %segoltha && "$zoneid" = "1" then
                    {
                        gosub MOVE 476
                        gosub MOVE 30
                    }
                if "$zoneid" = "1" then 
                    {
                        if %kronars < 40 then goto NOCOIN
                        gosub MOVE 236
                        gosub FERRYLOGIC
                    }
                pause
                put south
                wait
                put #mapper reset
            }
  if "$zoneid" = "60" then gosub MOVE 57
  if "$zoneid" = "61" && "%detour" = "ain" then gosub MOVE 126
  if "$zoneid" = "114" && "%detour" != "ain" then
            {
                if %dokoras < 60 then goto NOCOIN
                gosub MOVE 4
                gosub FERRYLOGIC
                send west
                wait
            }
  if "$zoneid" = "63" && $Athletics.Ranks < %undergondola then
            {
                gosub MOVE 112
                gosub MOVE 100
                gosub MOVE 126
            }
  if "$zoneid" = "112" && "%detour" = "ain" then
            {
                if $Athletics.Ranks >= %undergondola then
                    {
                        gosub MOVE 112
                        gosub MOVE 130
                    }
                if $Athletics.Ranks < %undergondola then
                    {
                        if %dokoras < 60 then goto NOCOIN
                        gosub MOVE 98
                        gosub FERRYLOGIC
                    }
            }
  if "$zoneid" = "112" then gosub MOVE 112
  if "$zoneid" = "61" then gosub MOVE 130
  if "$zoneid" = "63" then gosub MOVE 112
  if "$zoneid" = "62" && $Athletics.Ranks >= %undergondola then
            {
                gosub MOVE 153
            }
  if "$zoneid" = "62" then 
            {
                gosub MOVE 2
                gosub FERRYLOGIC
            }
  if "$zoneid" = "65" then gosub MOVE 1
  if "$zoneid" = "68b" then gosub MOVE 44
  if "$zoneid" = "68a" then gosub MOVE 29
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub MOVE 15
  if "$zoneid" = "68" && %shardcitizen = "yes" then
            {
                gosub MOVE 1
                gosub MOVE 129
            }
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub MOVE 15
  if "$zoneid" = "67" && "$guild" = "Thief" then
            {
                gosub MOVE 566
                gosub MOVE 23
            }
  if "$zoneid" = "67" then gosub MOVE 132
  if "$zoneid" = "66" then gosub MOVE 217
  if "$zoneid" = "69" then gosub MOVE 283
  if "$zoneid" = "127" && matchre("(raven|outer|inner|ain)","%detour") then gosub MOVE 510
  if "$zoneid" = "126" && matchre("(raven|outer|inner|ain)","%detour") then gosub MOVE 49
  if "$zoneid" = "116" && matchre("(raven|ain)","%detour") then gosub MOVE 3
  if "$zoneid" = "123" && "%detour" = "ain" then
            {
                if %dokoras < 60 then goto NOCOIN
                gosub MOVE 174
                gosub FERRYLOGIC
            }
  if "$zoneid" = "123" && "%detour" = "raven" then
            {
                gosub MOVE 133
                goto ARRIVED
            }
  if "$zoneid" = "123" then gosub MOVE 169
  if "$zoneid" = "116" && "%detour" = "outer" then
            {
                gosub MOVE 225
                goto ARRIVED
            }
  if "$zoneid" = "116" && "%detour" = "inner" then
            {
                gosub MOVE 96
                goto ARRIVED
            }
  if "$zoneid" = "113" && "$roomid" = "4" then
            {
                put west
                waitforre ^Obvious
            }
  if "$zoneid" = "113" && "$roomid" = "8" then 
            {
                put north
                waitforre ^Obvious
            }
  if "$zoneid" = "114" && "%detour" = "ain" then gosub MOVE 34
  if "$zoneid" = "116" then gosub MOVE 217
  if "$zoneid" = "126" then gosub MOVE 103
  if "$zoneid" = "127" then gosub MOVE 24
ARRIVED:
  put #parse YOU ARRIVED!
  put #parse REACHED YOUR DESTINATION
  #put #play Just Arrived.wav
  Echo ##  YOU ARRIVED AT YOUR DESTINATION In %t seconds!  That's FAST! ##
  exit
NOCOIN:
  put #parse NO COINS!
  Echo ## You don't have enough coins to travel, you vagrant!  Trying to get coins from the nearest bank!!!
  pause
  put wealth
  pause
  if "$zoneid" = "1" then
        {
            var currencyneeded kro
            gosub MOVE exchange
            gosub KRONARS
            if %kronars >= 40 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 35 copper
            wait
        }
  if "$zoneid" = "60" then gosub MOVE leth
  if "$zoneid" = "61" then
        {
            var currencyneeded kro
            gosub MOVE 57
            gosub MOVE exchange
            gosub KRONARS
            if %kronars >= 40 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 35 copper
            wait
        }
   if "$zoneid" = "30" then
        {
            var currencyneeded lir
            gosub MOVE exchange
            gosub LIRUMS
            if %lirums >= 70 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 70 copper
            wait
        }
   if "$zoneid" = "7" then
        {
            var currencyneeded lir
            gosub MOVE 349
            gosub MOVE exchange
            gosub LIRUMS
            if %lirums >= 70 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 100 copper
            wait
            gosub MOVE exchange
            put exchange 100 copper kronars for lirums
            wait
        }
    if "$zoneid" = "40" then
        {
            var currencyneeded lir
            gosub MOVE 211
            gosub MOVE exchange
            gosub LIRUMS
            if %lirums >= 70 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 70 copper
            wait
        }
    if "$zoneid" = "113" && "$roomid" = "4" then gosub MOVE 10
    if "$zoneid" = "113" && "$roomid" = "9" then gosub MOVE 8
    if "$zoneid" = "114" then
        {
            var currencyneeded dok
            gosub MOVE exchange
            gosub DOKORAS
            if %dokoras > 60 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 60 copper
            wait
        }
    if "$zoneid" = "113" && "$roomid" = "6" then gosub MOVE 7
    if "$zoneid" = "123" then gosub MOVE hibar
    if "$zoneid" = "116" then
        {
            var currencyneeded dok
            gosub MOVE 1exchange
            gosub DOKORAS
            if %dokoras > 60 then goto COIN.CONTINUE
            gosub MOVE 1teller
            put withdraw 60 copper
            wait
        }
     if "$zoneid" = "113" && "$roomid" = "1" then gosub MOVE 5
     if "$zoneid" = "112" then
        {
            var currencyneeded dok
            gosub MOVE exchange
            gosub DOKORAS
            if %dokoras > 60 then goto COIN.CONTINUE
            gosub MOVE teller
            put withdraw 60 copper
            wait
        }
COIN.CONTINUE:
    put wealth
    pause 0.5
    if %currencyneeded = "kro" && %kronars < 40 then goto COINQUIT
    if %currencyneeded = "lir" && %lirums < 70 then goto COINQUIT
    if %currencyneeded = "dok" && %dokoras < 60 then goto COINQUIT
    put #echo >Log Green You withdrew money to ride the ferry from Zone $zonename!
    ECHO YOU HAD MONEY IN THE BANK, LET'S TRY THIS AGAIN!
    pause
    goto %label
COINQUIT:
  echo YOU DIDN'T HAVE ENOUGH MONEY IN THE BANK TO RIDE PUBLIC TRANSPORT.  
  echo EITHER GET MORE ATHLETICS, OR MORE MONEY, FKING NOOB!
  exit
LIRUMS:
     var Target.Currency LIRUMS
     gosub EXCHANGE KRONARS
     if %lirums >= 70 then goto RETURN
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
KRONARS:
     var Target.Currency KRONARS
     gosub EXCHANGE LIRUMS
     if %kronars >= 40 then goto RETURN
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
DOKORAS:
     var Target.Currency DOKORAS
     gosub EXCHANGE KRONARS
     if %dokoras >= 60 then goto RETURN
     gosub EXCHANGE LIRUMS
     goto EXCHANGE.FINISH
EXCHANGE:
     var Coin $0
EXCHANGE.CONTINUE:
     pause 0.1
     matchre EXCHANGE.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre EXCHANGE.FINISH ^You hand your money to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre EXCHANGE.FINISH ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre EXCHANGE.FINISH ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre EXCHANGE.FINISH ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre EXCHANGE.FINISH ^But you don't have any .*\.
     matchre EXCH.INVIS ^How can you exchange money when you can't be seen\?
     matchre EXCHANGE.SMALLER transactions larger than a thousand
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE ALL %Coin FOR %Target.Currency
     matchwait
EXCHANGE.SMALLER:
     pause 0.1
     pause 0.1
     matchre EXCHANGE.SMALLER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre EXCHANGE.SMALLER ^You hand your .* to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre EXCH.INVIS ^How can you exchange money when you can't be seen\?
     matchre EXCHANGE.CONTINUE ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre EXCHANGE.CONTINUE ^But you don't have any .*\.
     matchre EXCHANGE.CONTINUE ^You don't have that many
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE 1000 plat %Coin FOR %Target.Currency
     matchwait
EXCHANGE.FINISH:
     put wealth
     pause 0.5
     RETURN
EXCH.INVIS:
     pause 0.1
     send hum scale
     pause 0.5
     send stop hum
     pause 0.1
     goto EXCHANGE.CONTINUE
     
FERRYLOGIC:
  if contains("(1|7|30|60|40|113)","$zoneid" then goto ferry
  if "$zoneid" = "66" then
        {
            var direction north
            goto GONDOLA
        }
  if "$zoneid" = "62" then
        {
            var direction south
            goto GONDOLA
        }
  else goto nodestination
GONDOLA:
  pause .1
  pause .1
  send look
  pause 3
  matchre ONGONDOLA \[Gondola\,
  if matchre ("$roomobjs","gondola") then send go gondola
  matchwait 2
  pause 10
  goto GONDOLA
ONGONDOLA:
  pause 
  pause
  if "%direction" = "north" then put north
  else put south
GONDOLAWAIT:
  pause
  waitforre ^With a soft
  put out
  pause
  put #mapper reset
  return
FERRY:
  pause .1
  pause .1
  action var OFFTRANSPORT pier when the Riverhaven pier\.
  action var OFFTRANSPORT wharf when the Langenfirth wharf\.
  action var OFFTRANSPORT dock when \[\"Her Opulence\"\]|\[\"Hodierna\'s Grace\"\]|\[\"Kertigen\'s Honor\"\]|\[\"His Daring Exploit\"\]|\[The Evening Star\]|\[The Damaris\' Kiss\]|\[A Birch Skiff\]|\[A Highly Polished Skiff\]
  ## Future money stuff - "Hey," he says, "You haven't got enough lirums to pay for your trip.  Come back when you can afford the fare."
  matchre ONFERRY \[\"Her Opulence\"\]|\[\"Hodierna\'s Grace\"\]|\[\"Kertigen\'s Honor\"\]|\[\"His Daring Exploit\"\]|\[\"Northern Pride\"\, Main Deck\]|\[\"Theren\'s Star\"\, Deck\]|\[The Evening Star\]|\[The Damaris\' Kiss\]|\[A Birch Skiff\]|\[A Highly Polished Skiff\]
  send look
  if matchre ("$roomobjs","Star") then send go ferry
  if matchre ("$roomobjs","skiff") then send go skiff
  if matchre ("$roomobjs","Kiss") then send go ferry
  if matchre ("$roomobjs","ferry") then send go ferry
  if matchre ("$roomobjs","barge") then send go barge
  matchwait 2
  pause 10
  goto FERRY
ONFERRY:
  pause .1
  pause .1
  matchre OFFTHERIDE dock and its crew ties the (ferry|barge) off\.|^You come to a very soft stop|^The skiff lightly taps
  matchwait
OFFTHERIDE:
  pause
  put go %offtransport
  pause
  put #mapper reset
  return

## Movement 
MOVE.RETRY:
  math move.retry add 1
  if %move.retry > 3 then goto move.fail
  echo ***
  echo *** Retrying move to $1 $2 in %move.retry second(s).
  echo ***
  pause %move.retry
  goto MOVE.GOTO
MOVE:
  delay 0.0001
  var move.skip 0
  var move.retry 0
  var move.fail 0
  var move.room $0
MOVE.GOTO:
  #gosub retreat
  matchre MOVE.GOTO ^\.\.\.wait|^Sorry\,
  matchre MOVE.RETURN ^YOU HAVE ARRIVED
  matchre MOVE.SKIP ^SHOP CLOSED
  matchre MOVE.RETRY ^MOVE FAILED
  matchre MOVE.FAIL ^DESTINATION NOT FOUND
  matchre MOVE.RETRY ^You can't go
  matchre MOVE.RETRY ^You're still recovering from your recent attack\.
  matchre MOVE.RETREAT ^You are engaged
  matchre MOVE.RETREAT ^You can't do that while engaged\!
  put #goto %move.room
  matchwait
MOVE.FAIL:
  var move.fail 1
  goto MOVE.RETURN
MOVE.RETREAT:
  pause 0.1
  gosub RETREAT
  pause 0.1
  goto MOVE.RETRY
MOVE.SKIP:
  var move.skip 1
RETREAT:
  pause 0.1
  pause 0.1
  send retreat;retreat
  pause 0.1
  pause 0.1
  return
MOVE.RETURN:
  pause 0.1
  pause 0.001
  #put #mapper reset
  pause 0.001
  return
RETURN:
  delay 0.001
  RETURN
  
MOVE_RANDOM:
     delay 0.0001
     random 1 13
     if (%r = 1) && (!$north) then goto MOVE_RANDOM
     if (%r = 2) && (!$northeast) then goto MOVE_RANDOM
     if (%r = 3) && (!$east) then goto MOVE_RANDOM
     if (%r = 4) && (!$southeast) then goto MOVE_RANDOM
     if (%r = 5) && (!$south) then goto MOVE_RANDOM
     if (%r = 6) && (!$southwest) then goto MOVE_RANDOM
     if (%r = 7) && (!$west) then goto MOVE_RANDOM
     if (%r = 8) && (!$northwest) then goto MOVE_RANDOM
     if (%r = 9) && (!$out) then goto MOVE_RANDOM
     if (%r = 10) && (!$up) then goto MOVE_RANDOM
     if (%r = 11) && (!$down) then goto MOVE_RANDOM
     if (%r = 12) && !matchre("$roomobjs","doorway|door") then goto MOVE_RANDOM
     if (%r = 13) && !matchre("$roomobjs","archway|arch") then goto MOVE_RANDOM
     #
     if (%r = 1) then var Direction north
     if (%r = 2) then var Direction northeast
     if (%r = 3) then var Direction east
     if (%r = 4) then var Direction southeast
     if (%r = 5) then var Direction south
     if (%r = 6) then var Direction southwest
     if (%r = 7) then var Direction west
     if (%r = 8) then var Direction northwest
     if (%r = 9) then var Direction out
     if (%r = 10) then var Direction up
     if (%r = 11) then var Direction down
     if (%r = 12) then var Direction go door
     if (%r = 13) then var Direction go arch
     #
     if (%r = 1) then var Reverse.Direction south
     if (%r = 2) then var Reverse.Direction southwest
     if (%r = 3) then var Reverse.Direction west
     if (%r = 4) then var Reverse.Direction northwest
     if (%r = 5) then var Reverse.Direction north
     if (%r = 6) then var Reverse.Direction northeast
     if (%r = 7) then var Reverse.Direction east
     if (%r = 8) then var Reverse.Direction southeast
     if (%r = 9) then var Reverse.Direction out
     if (%r = 10) then var Reverse.Direction down
     if (%r = 11) then var Reverse.Direction up
     if (%r = 12) then var Reverse.Direction go door
     if (%r = 13) then var Reverse.Direction go arch
     #
     var Exits 0
     if ($north) then math Exits add 1
     if ($northeast) then math Exits add 1
     if ($east) then math Exits add 1
     if ($southeast) then math Exits add 1
     if ($south) then math Exits add 1
     if ($southwest) then math Exits add 1
     if ($west) then math Exits add 1
     if ($out) then math Exits add 1
     if ($up) then math Exits add 1
     if ($down) then math Exits add 1
     if matchre("$roomobjs","doorway|door") then math Exits add 1
     if matchre("$roomobjs","archway|arch") then math Exits add 1
     #
     # don't move "back" on a path unless we hit a dead end
     if (%Exits > 1) && ("%Last.Direction" = "%Reverse.Direction") then goto MOVE_RANDOM
     #
     var Last.Direction %Direction
     gosub MOVE_RESUME
     RETURN
     
MOVEIT:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
MOVE_RESUME:
     matchre MOVE_RESUME ^\.\.\.wait|^Sorry\,
     matchre MOVE_RESUME ^You make your way up the .*\.\s*Partway up\, you make the mistake of looking down\.\s*Struck by vertigo\, you cling to the .* for a few moments\, then slowly climb back down\.
     matchre MOVE_RESUME ^You pick your way up the .*\, but reach a point where your footing is questionable\.\s*Reluctantly\, you climb back down\.
     matchre MOVE_RESUME ^You approach the .*\, but the steepness is intimidating\.
     matchre MOVE_RESUME ^You struggle
     matchre MOVE_RESUME ^You blunder
     matchre MOVE_RESUME ^You slap
     matchre MOVE_RESUME ^You work
     matchre MOVE_RESUME make much headway
     matchre MOVE_RESUME ^You flounder around in the water\.
     matchre MOVE_RETREAT ^You are engaged to .*\!|^You cannot do that while engaged
     matchre MOVE_STAND ^You start up the .*\, but slip after a few feet and fall to the ground\!\s*You are unharmed but feel foolish\.
     matchre MOVE_STAND ^Running heedlessly over the rough terrain\, you trip over an exposed root and land face first in the dirt\.
     matchre MOVE_STAND ^You can't do that while lying down\.
     matchre MOVE_STAND ^You can't do that while sitting\!
     matchre MOVE_STAND ^You must be standing to do that\.
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE_DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE_FAILED ^You can't go there
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_END ^It's pitch dark
     matchre MOVE_END ^Obvious
     send %Direction
     matchwait
MOVE_STAND:
     pause 0.1
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
     matchwait
MOVE_RETREAT:
     pause 0.1
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry\,
     matchre MOVE_RETREAT ^You retreat back to pole range\.
     matchre MOVE_RETREAT ^You try to back away
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_RESUME ^You retreat from combat\.
     matchre MOVE_RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait
MOVE_DIG:
     pause 0.1
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait
MOVE_DIG_STAND:
     pause 0.1
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait
MOVE_FAILED:
     evalmath movefailCounter (movefailCounter + 1)
     if (%movefailCounter > 3) then goto MOVE_FAIL_BAIL
     pause 0.5
     goto MOVE_RESUME
MOVE_FAIL_BAIL:
     put #echo
     put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo Crimson Skipping to next shop
     put #echo
     put #parse MOVE FAILED
     gosub clear
     goto %LAST
MOVE_END:
     pause 0.0001
     RETURN

nodestination:
  Echo ## Either you did not enter a destination, or your destination is not recognized.  Please try again! ##
  Echo ## Valid Destinations are: ##
  Echo -------------------------------------------
  Echo ## Zoluren:
  Echo ## Crossing | Arthe Dale | Tiger Clan ##
  Echo ## Wolf Clan | Dirge | Leth Deriel ##
  Echo ## Knife Clan | Acenemacra | Kaerna Village ##
  Echo ## Stone Clan | Ilaya Taipa | Misenseor ##
  Echo ## Sorrow's Reach | Vipers, Guardians, Leucros ##
  Echo -------------------------------------------
  Echo ## Therengia:
  Echo ## Riverhaven | Rossmans | Therenborough ##
  Echo ## Langenfirth | El'Bains | Rakash Village ##
  Echo ## Fornsted | Zaulfung ##
  Echo -------------------------------------------
  Echo ## Ilithi:
  Echo ## Shard | Horse Clan | Fayrin's Rest ##
  Echo ## Steelclaw Clan | Spire |Corik's Wall ##
  Echo ## Ylono ##
  Echo -------------------------------------------
  Echo ## Forfedhdar:
  Echo ## Raven's Point | Ain Ghazal| Outer Hib ##
  Echo ## Inner Hib | Hibarnhvidar |Boar Clan ##
  Echo -------------------------------------------
  exit