#debug 5
# Script to Travel #
# Written by Chris/Achilles #
# Requires EXP Plugin by VTCifer #
# If you are calling this script via another, use ^YOU ARRIVED! to match the end of travelling!
# This script will NOT fetch coin for you, make sure you have coin if you need it!
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
    var undersegoltha 70
##########################################
##                                      ##
##  ARE YOU A SHARD CITIZEN?            ##
##   yes OR no                          ##
    var shardcitizen yes
##                                      ##
##########################################
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
action goto nocoin when ^\"Hey\,\" he says\, \"You haven\'t
action put #var Guild $1 when Guild\: (\S+)
action put #var Circle $1 when Circle\: (\d+)
var kronars 0
var dokoras 0
var lirums 0
action var kronars 0 when No Kronars\.
action var kronars $1 when \((\d*) copper Kronars\)\.
action var lirums 0 when No Lirums\.
action var lirums $1 when \((\d*) copper Lirums\)\.
action var dokoras 0 when No Dokoras\.
action var dokoras $1 when \((\d*) copper Dokoras\)\.
var destination %1
var detour nil
put #mapper reset
pause .5
put info
wait
put exp 0
wait
put #var save
if "%destination" = "" then goto nodestination
if "$zoneid" = "0" then
        {
            ECHO ### You are in a spot not recognized by Genie, please start somewhere else! ###
            exit
        }
if matchre("(cro|cros|cross|crossi|crossin|crossing|crossings)","%1") then goto crossing
if matchre("(wol|wolf|wolfc|wolfcl|wolfcla|wolfclan)","%destination") then
                {
                    var detour wolf
                    goto crossing
                }
if matchre("(kni|knif|knife|knifec|knifecl|knifecla|knifeclan)","%destination") then
                {
                    var detour knife
                    goto crossing
                }
if matchre("(tig|tige|tiger|tigerc|tigercl|tigercla|tigerclan)","%destination") then
                {
                    var detour tiger
                    goto crossing
                }
if matchre("(dir|dirg|dirge)","%destination") then
                {
                    var detour dirge
                    goto crossing
                }
if matchre("(art|arth|arthe|arthed|artheda|arthedal|arthedale)","%destination") then
                {
                    var detour arthe
                    goto crossing
                }
if matchre("(kae|kaer|kaern|kaerna)","%destination") then
                {
                    var detour kaerna
                    goto crossing
                }
if matchre("(ila|ilay|ilaya|ilayat|ilayata|ilayatai|ilayataip|ilayataipa|tai|taip|taipa)","%destination") then
                {
                    var detour taipa
                    goto crossing
                }
if matchre("(let|leth|lethd|lethde|lethder|lethderi|lethderie|lethderiel)","%destination") then
                {
                    var detour leth
                    goto crossing
                }
if matchre("(ace|acen|acena|acenam|acenama|acenamac|acenamacr|acenamacra)","%destination") then
                {
                    var detour acen
                    goto crossing
                }
if matchre("(vip|vipe|viper|vipers|gua|guard|guardi|guardia|guardian|guardians|leu|leuc|leucr|leucro|leucros)","%destination") then
                {
                    var detour viper
                    goto crossing
                }
if matchre("(sor|sorr|sorro|sorrow|sorrows)","%destination") then
                {
                    var detour sorrow
                    goto crossing
                }
if matchre("(mis|mise|misen|misens|misense|misenseo|misenseor)","%destination") then
                {
                    var detour misen
                    goto crossing
                }
if matchre("(sto|ston|stone)","%destination") then
                {
                    var detour stone
                    goto crossing
                }
if matchre("(sha|shar|shard)","%destination") then goto ilithi
if matchre("(spi|spir|spire)","%destination") then
                {
                    var detour spire
                    goto ilithi
                }
if matchre("(hor|hors|horse)","%destination") then
                {
                    var detour horse
                    goto ilithi
                }
if matchre("(fay|fayr|fayri|fayrin|fayrin'|fayrin's)","%destination") then
                {
                    var detour fayrin
                    goto ilithi
                }
if matchre("(ste|stee|steel|steelc|steelcl|steelcla|steelclaw)","%destination") then
                {
                    var detour steel
                    goto ilithi
                }
if matchre("(cor|cori|corik|corik'|corik's)","%destination") then
                {
                    var detour corik
                    goto ilithi
                }
if matchre("(ada|adan|adan'|adan'f)","%destination") then
                {
                    var detour adan'f
                    goto ilithi
                }
if matchre("(ylo|ylon|ylono)","%destination") then
                {
                    var detour ylono
                    goto ilithi
                }
if matchre("(riv|rive|river|riverh|riverha|riverhav|riverhave|riverhaven|hav|have|haven)","%destination") then
                {
                    var detour haven
                    goto therengia
                }
if matchre("(ros|ross|rossm|rossma|rossman|rossmans)","%destination") then
                {
                    var detour rossman
                    goto therengia
                }
if matchre("(the|ther|there|theren|therenb|therenbo|therenbor|therenborou|therenboroug|therenborough)","%destination") then
                {
                    var detour theren
                    goto therengia
                }
if matchre("(lan|lang|lange|langen|langenf|langenfi|langenfir|langenfirt|langenfirth)","%destination") then
                {
                    var detour lang
                    goto therengia
                }
if matchre("(rak|raka|rakas|rakash)","%destination") then
                {
                    var detour rakash
                    goto therengia
                }
if matchre("(mus|musp|muspa|muspar|muspari)","%destination") then
                {
                    var detour muspari
                    goto therengia
                }
if matchre("(forn|forns|fornst|fornste|fornsted)","%destination") then
                {
                    var detour fornsted
                    goto therengia
                }
if matchre("(zau|zaul|zaulf|zaulfu|zaulfun|zaulfung)","%destination") then
                {
                    var detour zaulfung
                    goto therengia
                }
if matchre("(ain|aing|aingh|aingha|ainghaz|ainghaza|ainghazal)","%destination") then
                {
                    var detour ain
                    goto ford
                }
if matchre("(rav|rave|raven'|raven's)","%destination") then
                {
                    var detour raven
                    goto ford
                }
if matchre("(out|oute|outer|hib|hiba|hibar|hibarn|hibarnh|hibarnhv|hibarnhvi|hibarnhvid|hibarnhvida|hibarnhvidar|hibble|hibbles)","%destination") then
                {
                    var detour outer
                    goto ford
                }
if matchre("(inn|inne|inner)","%destination") then
                {
                    var detour inner
                    goto ford
                }
if matchre("(boa|boar)","%destination") then goto ford
goto nodestination

crossing:
  var label crossing
  if "$zoneid" = "41" then gosub move 53
  if "$zoneid" = "42" then gosub move 2
  if "$zoneid" = "59" then gosub move 12
  if "$zoneid" = "114" then
            {
                gosub move 1
                gosub ferrylogic
                send go oak doors
            }
  if "$zoneid" = "40a" then gosub move 125
  if "$zoneid" = "40" && $Athletics.Ranks >= %rossmansouth then gosub move 213
  if "$zoneid" = "40" && $Athletics.Ranks < %rossmansouth then
            {
                gosub move 36
                gosub ferrylogic
            }
  if "$zoneid" = "34a" then gosub move 134
  if "$zoneid" = "34" then gosub move 15
  if "$zoneid" = "33a" then gosub move 46
  if "$zoneid" = "33" then gosub move 1
  if "$zoneid" = "32" then gosub move 1
  if "$zoneid" = "31" then gosub move 1
  if "$zoneid" = "30" && $Athletics.Ranks < %faldesu then
            {
                gosub move 103
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "30" && $Athletics.Ranks >= %faldesu then
            {
                gosub move 203
                gosub move 79
            }
  if "$zoneid" = "14c" then gosub move 21
  if "$zoneid" = "127" then gosub move 510
  if "$zoneid" = "126" then gosub move 49
  if "$zoneid" = "116" then gosub move 3
  if "$zoneid" = "123" then gosub move 175
  if "$zoneid" = "69" then gosub move 1
  if "$zoneid" = "68a" then gosub move 29
  if "$zoneid" = "68b" then gosub move 44
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub move 15
  if "$zoneid" = "68" && %shardcitizen = "yes" then
            {
                gosub move 1
                gosub move 135
            }
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub move 15
  if "$zoneid" = "67" && "$guild" = "Thief" then
            {
                gosub move 566
                gosub move 23
            }
  if "$zoneid" = "67" then gosub move 132
  if "$zoneid" = "66" && $Athletics.Ranks >= %undergondola then gosub move 317
  if "$zoneid" = "66" && $Athletics.Ranks < %undergondola then
            {
                gosub move 156
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "63" then gosub move 112
  if "$zoneid" = "65" then gosub move 44
  if "$zoneid" = "62" then gosub move 100
  if "$zoneid" = "112" then gosub move 112
  if "$zoneid" = "58" then gosub move 2
  if "$zoneid" = "60" && matchre("(leth|acen|taipa)","%detour") then gosub move 57
  if "$zoneid" = "61" && matchre("(leth|acen|taipa)","%detour") then
            {
                if "%detour" = "acen" then
                    {
                        gosub move 178
                        gosub move 47
                    }
                if "%detour" = "taipa" then
                    {
                        gosub move 126
                        gosub move 27
                    }
                if "%detour" = "leth" then gosub move 18
                goto arrived
            }
  if "$zoneid" = "61" then gosub move 115
  if "$zoneid" = "60" && "$Guild" = "Thief" then
            {
                if $Athletics.Ranks >= %undersegoltha then
                    {
                        gosub move 107
                        gosub move 6
                    }
            }
  if "$zoneid" = "60" && $Athletics.Ranks >= %segoltha then gosub move 108
  if "$zoneid" = "60" && $Athletics.Ranks < %segoltha then
            {
                gosub move 42
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "50" then gosub move 8
  if "$zoneid" = "4a" then gosub move 15
  if "$zoneid" = "4b" then gosub move 1
  if "$zoneid" = "4" then gosub move 14
  if "$zoneid" = "13" then gosub move 71
  if "$zoneid" = "12a" then gosub move 60
  if "$zoneid" = "10" then gosub move 116
  if "$zoneid" = "9b" then gosub move 9
  if "$zoneid" = "14b" then gosub move 217
  if "$zoneid" = "11" then gosub move 2
  if "$zoneid" = "1" && matchre("(arthe|dirge|kaerna|stone|misen|sorrow|fist)","%detour") then gosub move 171
  if "$zoneid" = "7" && matchre("(arthe|dirge|kaerna|stone|misen|sorrow|fist)","%detour") then
            {
                if "%detour" = "dirge" then
                    {
                        gosub move 147
                        gosub move 38
                    }
                if "%detour" = "arthe" then gosub move 535
                if "%detour" = "kaerna" then gosub move 352
                if "%detour" = "stone" then gosub move 396
                if "%detour" = "fist" then gosub move 253
                if "%detour" = "misen" then gosub move 437
                if "%detour" = "viper" then
                    {
                        gosub move 394
                        if $Perception.Ranks > 150 then gosub move 5
                    }
                if "%detour" = "sorrow" then 
                    {
                        gosub move 397
                        gosub move 77
                    }
                goto arrived
            }
  if "$zoneid" = "7" then gosub move 349
  if "$zoneid" = "8" then gosub move 43
  if "$zoneid" = "1" && matchre("(wolf|knife|tiger)","%detour") then
            {
                gosub move 172
                if "%detour" = "wolf" then gosub move 126
                if "%detour" = "knife" then gosub move 459
                if "%detour" = "tiger" then gosub move 87
                goto arrived
            }
  if "$zoneid" = "1" && matchre("(leth|acen|taipa)","%detour") then
            {
                if "$Guild" = "Thief" then
                    {
                        if $Athletics.Ranks >= %undersegoltha then
                            {
                                gosub move 650
                                gosub move 23
                            }
                    }
                if $Athletics.Ranks >= %segoltha && "$zoneid" = "1" then
                    {
                        gosub move 476
                        gosub move 30
                    }
                if "$zoneid" = "1" then 
                    {
                        gosub move 236
                        gosub ferrylogic
                    }
                pause
                put south
                wait
                put #mapper reset
                gosub move 57
                if "%detour" = "acen" then
                    {
                        gosub move 178
                        gosub move 47
                    }
                if "%detour" = "taipa" then
                    {
                        gosub move 126
                        gosub move 27
                    }
                if "%detour" = "leth" then gosub move 18
            }
  if "$zoneid" = "1" then gosub move 231
  goto arrived

ilithi:
  var label ilithi
  #debug 10
  if "$zoneid" = "127" then gosub move 510
  if "$zoneid" = "126" then gosub move 49
  if "$zoneid" = "116" then gosub move 3
  if "$zoneid" = "114" then
            {
                gosub move 4
                gosub ferrylogic
                send west
                wait
            }
  if "$zoneid" = "123" then gosub move 175
  if "$zoneid" = "41" then gosub move 53
  if "$zoneid" = "42" then gosub move 2
  if "$zoneid" = "59" then gosub move 12
  if "$zoneid" = "114" then
            {
                gosub move 1
                gosub ferrylogic
                send go oak doors
            }
  if "$zoneid" = "40a" then gosub move 125
  if "$zoneid" = "40" && $Athletics.Ranks >= %rossmansouth then gosub move 213
  if "$zoneid" = "40" && $Athletics.Ranks < %rossmansouth then
            {
                gosub move 36
                gosub ferrylogic
            }
  if "$zoneid" = "34a" then gosub move 134
  if "$zoneid" = "34" then gosub move 15
  if "$zoneid" = "33a" then gosub move 46
  if "$zoneid" = "33" then gosub move 1
  if "$zoneid" = "32" then gosub move 1
  if "$zoneid" = "31" then gosub move 1
  if "$zoneid" = "30" && $Athletics.Ranks < %faldesu then
            {
                gosub move 103
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "30" && $Athletics.Ranks >= %faldesu then
            {
                gosub move 203
                gosub move 79
            }
  if "$zoneid" = "14c" then gosub move 21
  if "$zoneid" = "13" then gosub move 71
  if "$zoneid" = "12a" then gosub move 60
  if "$zoneid" = "4a" then gosub move 15
  if "$zoneid" = "4" then gosub move 14
  if "$zoneid" = "8" then gosub move 43
  if "$zoneid" = "10" then gosub move 116
  if "$zoneid" = "9b" then gosub move 9
  if "$zoneid" = "14b" then gosub move 217
  if "$zoneid" = "11" then gosub move 2
  if "$zoneid" = "7" then gosub move 349
  if "$zoneid" = "1" then
            {
                if "$Guild" = "Thief" then
                    {
                        if $Athletics.Ranks >= %undersegoltha then
                            {
                                gosub move 650
                                gosub move 23
                            }
                    }
                if $Athletics.Ranks >= %segoltha && "$zoneid" = "1" then
                    {
                        gosub move 476
                        gosub move 30
                    }
                if "$zoneid" = "1" then 
                    {
                        gosub move 236
                        gosub ferrylogic
                    }
                pause
                put south
                wait
                put #mapper reset
            }
  if "$zoneid" = "60" then gosub move 57
  if "$zoneid" = "112" then gosub move 112
  if "$zoneid" = "59" then gosub move 12
  if "$zoneid" = "58" then gosub move 2
  if "$zoneid" = "61" then gosub move 130
  if "$zoneid" = "63" then gosub move 112
  if "$zoneid" = "62" && $Athletics.Ranks >= %undergondola then gosub move 153
  if "$zoneid" = "62" then 
            {
                gosub move 2
                gosub ferrylogic
            }
  if "$zoneid" = "69" && matchre("(horse|spire)","%detour") then
            {
                if "%detour" = "horse" then gosub move 199
                if "%detour" = "spire" then gosub move 334
                goto arrived
            }
  if "$zoneid" = "65" then gosub move 1
  #if "$zoneid" = "69" && "%shardcitizen" = "yes" then gosub move 31
  if "$zoneid" = "69" then gosub move 1
  if "$zoneid" = "68" && matchre("(adan'f|corik)","%detour") then
            {
                if "%detour" = "corik" then gosub move 114
                if "%detour" = "adan'f" then gosub move 29
                goto arrived
            }
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub move 225
  if "$zoneid" = "68" && %shardcitizen = "yes" then gosub move 1
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub move 15
  if "$zoneid" = "67" && "$guild" = "Thief" && matchre("(steel|ylono|fayrin|horse|spire)","%detour") then
            {
                gosub move 566
                gosub move 23
            }
  if "$zoneid" = "67" && "$guild" = "Thief" && matchre("(adan'f|corik)","%detour") then
            {
                gosub move 228
                pause
                send climb embrasure
                wait
                if "%detour" = "adan'f" then gosub move 29
                if "%detour" = "corik" then gosub move 114
            }
  if "$zoneid" = "67" && matchre("(steel|ylono|fayrin|horse|spire|corik|adan'f)","%detour") then gosub move 132
  if "$zoneid" = "66" && matchre("(steel|fayrin|ylono|corik|adan'f)","%detour") then
            {
                if "%detour" = "steel" then gosub move 99
                if "%detour" = "fayrin" then gosub move 127
                if "%detour" = "ylono" then gosub move 495
                if matchre("(corik|adan'f)","%detour") then
                    {
                        if "$guild" = "Thief" then
                            {
                                gosub move 617
                                gosub move 19
                                gosub move 228
                                pause
                                send climb embrasure
                                wait
                            }
                        if "%shardcitizen" = "yes" && "$zoneid" = 66 then
                            {
                                gosub move 216
                                gosub move 230
                            }
                        if "$zoneid" = "66" then gosub move 3
                        if "%detour" = "adan'f" then gosub move 29
                        if "%detour" = "corik" then gosub move 114
                    }
                goto arrived
            }
  if "$zoneid" = "66" && matchre("(horse|spire)","%detour") then
            {
                gosub move 217
                if "%detour" = "horse" then gosub move 199
                if "%detour" = "spire" then gosub move 334
            }
  if "$zoneid" = "66" && "$guild" = "Thief" then
            {
                gosub move 617
                gosub move 19
            }
  if "$zoneid" = "66" then gosub move 216
  if "$zoneid" = "67" then gosub move 145
  goto arrived
therengia:
  var label therengia
  #debug 10
  if "$zoneid" = "127" then gosub move 510
  if "$zoneid" = "126" then gosub move 49
  if "$zoneid" = "116" then gosub move 3
  if "$zoneid" = "114" then
            {
                gosub move 1
                gosub ferrylogic
                put go oak doors
                waitforre ^Obvious
            }
  if "$zoneid" = "123" then gosub move 175
  if "$zoneid" = "69" then gosub move 1
  if "$zoneid" = "68a" then gosub move 29
  if "$zoneid" = "68b" then gosub move 44
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub move 15
  if "$zoneid" = "68" && %shardcitizen = "yes" then
            {
                gosub move 1
                gosub move 135
            }
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub move 15
  if "$zoneid" = "67" && "$guild" = "Thief" then
            {
                gosub move 566
                gosub move 23
            }
  if "$zoneid" = "67" then gosub move 132
  if "$zoneid" = "66" && $Athletics.Ranks >= %undergondola then gosub move 317
  if "$zoneid" = "66" && $Athletics.Ranks < %undergondola then
            {
                gosub move 156
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "65" then gosub move 44
  if "$zoneid" = "63" then gosub move 112
  if "$zoneid" = "62" then gosub move 100
  if "$zoneid" = "112" then gosub move 112
  if "$zoneid" = "59" then gosub move 12
  if "$zoneid" = "58" then gosub move 2
  if "$zoneid" = "61" then gosub move 115
  if "$zoneid" = "60" && "$Guild" = "Thief" then
            {
                if $Athletics.Ranks >= %undersegoltha then
                    {
                        gosub move 107
                        gosub move 6
                    }
            }
  if "$zoneid" = "60" && $Athletics.Ranks >= %segoltha then gosub move 108
  if "$zoneid" = "60" && $Athletics.Ranks < %segoltha then
            {
                gosub move 42
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "50" then gosub move 8
  if "$zoneid" = "13" then gosub move 71
  if "$zoneid" = "4a" then gosub move 15
  if "$zoneid" = "4" then gosub move 14
  if "$zoneid" = "8" then gosub move 43
  if "$zoneid" = "10" then gosub move 22
  if "$zoneid" = "9b" then gosub move 9
  if "$zoneid" = "14b" then gosub move 217
  if "$zoneid" = "11" then gosub move 2
  if "$zoneid" = "1" then gosub move 171
  if "$zoneid" = "7" && $Athletics.Ranks >= %faldesu then gosub move 197
  if "$zoneid" = "7" && $Athletics.Ranks < %faldesu then
            {
                gosub move 81
                gosub ferrylogic
            }
  if "$zoneid" = "14c" then gosub move 22
  if "$zoneid" = "33a" then gosub move 46
  if "$zoneid" = "33" then gosub move 1
  if "$zoneid" = "31" && "%detour" = "zaulfung" then gosub move 100
  if "$zoneid" = "31" then gosub move 1
  if "$zoneid" = "34a" && "%detour" != "rossman" then gosub move 145
  if "$zoneid" = "34" && "%detour" = "rossman" then
            {
                gosub move 22
                goto arrived
            }
  if "$zoneid" = "34" && matchre("(lang|theren|rakash|muspari|fornsted|el'bain)","%detour") then gosub move 137
  if "$zoneid" = "34" && matchre("(haven|zaulfung)","%detour") then
            {
                if $Athletics.Ranks < %rossmansouth then gosub move 137
                if $Athletics.Ranks >= %rossmansouth then
                    {
                        gosub move 15
                        gosub move 46
                        gosub move 1
                    }
            }
  if "$zoneid" = "41" then if matchre("(muspari|fornsted)","%detour") then
            {
                if matchre("(muspari|fornsted)","%detour") then
                    {
                        gosub move 85
                        goto arrived
                    }
                else gosub move 53
            }
  if "$zoneid" = "30" && matchre("(rossman|lang|theren|rakash|muspari|fornsted|el'bain)","%detour") then
            {
                if $Athletics.Ranks < %rossmannorth then
                    {
                        gosub move 99
                        gosub ferrylogic
                    }
                if $Athletics.Ranks >= %rossmannorth then
                    {
                        gosub move 174
                        gosub move 29
                        gosub move 48
                        if "%detour" = "rossman" then
                            {
                                gosub move 22
                                goto arrived
                            }
                        gosub move 137
                    }
            }
  if "$zoneid" = "40a" then gosub move 125
  if "$zoneid" = "42" && "%detour" != "theren" then gosub move 2
  if "$zoneid" = "40" && "%detour" = "rossman" then
            {
                gosub move 213
                gosub move 22
                goto arrived
            }
  if "$zoneid" = "40" && matchre("(lang|rakash|el'bain)","%detour") then
            {
                if "%detour" = "el'bain" then
                    {
                        gosub move 142
                        goto arrived
                    }
                if "%detour" = "lang" then
                    {
                        gosub move 1
                        goto arrived
                    }
                if "%detour" = "rakash" then
                    {
                        gosub move 263
                        gosub move 96
                        goto arrived
                    }
            }
  if "$zoneid" = "40" && matchre("(haven|zaulfung)","%detour") then
            {
                if $Athletics.Ranks >= %rossmansouth then 
                    {
                        gosub move 213
                        gosub move 15
                        gosub move 46
                        gosub move 1
                    }
                if $Athletics.Ranks < %rossmansouth then
                    {
                        gosub move 36
                        gosub ferrylogic
                    }
            }
  if "$zoneid" = "40" && "%detour" = "theren" then gosub move 211
  if "$zoneid" = "42" && "%detour" = "theren" then
            {
                gosub move 56
                goto arrived
            }
  if "$zoneid" = "40" && matchre("(muspari|fornsted)","%detour") then
            {
                gosub move 376
                gosub move 85
                goto arrived
            }
  if "$zoneid" = "30" && "%detour" = "zaulfung" then
            {
                gosub move 203
                gosub move 100
            }
  if "$zoneid" = "30" then
            {
                gosub move 8
                goto arrived
            }
  goto arrived
ford:
  var label ford
  #debug 10
  if "$zoneid" = "41" then gosub move 53
  if "$zoneid" = "40a" then gosub move 125
  if "$zoneid" = "42" then gosub move 2
  if "$zoneid" = "40" && $Athletics.Ranks >= %rossmansouth then gosub move 213
  if "$zoneid" = "40" && $Athletics.Ranks < %rossmansouth then
            {
                gosub move 36
                gosub ferrylogic
            }
  if "$zoneid" = "34a" then gosub move 134
  if "$zoneid" = "34" then gosub move 15
  if "$zoneid" = "33a" then gosub move 46
  if "$zoneid" = "33" then gosub move 1
  if "$zoneid" = "32" then gosub move 1
  if "$zoneid" = "31" then gosub move 1
  if "$zoneid" = "30" && $Athletics.Ranks < %faldesu then
            {
                gosub move 103
                pause
                gosub ferrylogic
            }
  if "$zoneid" = "30" && $Athletics.Ranks >= %faldesu then
            {
                gosub move 203
                gosub move 79
            }
  if "$zoneid" = "14c" then gosub move 21
  if "$zoneid" = "13" then gosub move 71
  if "$zoneid" = "4a" then gosub move 15
  if "$zoneid" = "4" then gosub move 14
  if "$zoneid" = "8" then gosub move 43
  if "$zoneid" = "10" then gosub move 22
  if "$zoneid" = "9b" then gosub move 9
  if "$zoneid" = "14b" then gosub move 217
  if "$zoneid" = "11" then gosub move 2
  if "$zoneid" = "7" then gosub move 349
  if "$zoneid" = "1" then
            {
                if "$Guild" = "Thief" then
                    {
                        if $Athletics.Ranks >= %undersegoltha then
                            {
                                gosub move 650
                                gosub move 23
                            }
                    }
                if $Athletics.Ranks >= %segoltha && "$zoneid" = "1" then
                    {
                        gosub move 476
                        gosub move 30
                    }
                if "$zoneid" = "1" then 
                    {
                        gosub move 236
                        gosub ferrylogic
                    }
                pause
                put south
                wait
                put #mapper reset
            }
  if "$zoneid" = "60" then gosub move 57
  if "$zoneid" = "61" && "%detour" = "ain" then gosub move 126
  if "$zoneid" = "114" && "%detour" != "ain" then
            {
                gosub move 4
                gosub ferrylogic
                send west
                wait
            }
  if "$zoneid" = "63" && $Athletics.Ranks < %undergondola then
            {
                gosub move 112
                gosub move 100
                gosub move 126
            }
  if "$zoneid" = "112" && "%detour" = "ain" then
            {
                if $Athletics.Ranks >= %undergondola then
                    {
                        gosub move 112
                        gosub move 130
                    }
                if $Athletics.Ranks < %undergondola then
                    {
                        gosub move 98
                        gosub ferrylogic
                    }
            }
  if "$zoneid" = "112" then gosub move 112
  if "$zoneid" = "61" then gosub move 130
  if "$zoneid" = "63" then gosub move 112
  if "$zoneid" = "62" && $Athletics.Ranks >= %undergondola then
            {
                gosub move 153
            }
  if "$zoneid" = "62" then 
            {
                gosub move 2
                gosub ferrylogic
            }
  if "$zoneid" = "65" then gosub move 1
  if "$zoneid" = "68b" then gosub move 44
  if "$zoneid" = "68a" then gosub move 29
  if "$zoneid" = "68" && "$guild" = "Thief" then gosub move 15
  if "$zoneid" = "68" && %shardcitizen = "yes" then
            {
                gosub move 1
                gosub move 129
            }
  if "$zoneid" = "68" && %shardcitizen = "no" then gosub move 15
  if "$zoneid" = "67" && "$guild" = "Thief" then
            {
                gosub move 566
                gosub move 23
            }
  if "$zoneid" = "67" then gosub move 132
  if "$zoneid" = "66" then gosub move 217
  if "$zoneid" = "69" then gosub move 283
  if "$zoneid" = "127" && matchre("(raven|outer|inner|ain)","%detour") then gosub move 510
  if "$zoneid" = "126" && matchre("(raven|outer|inner|ain)","%detour") then gosub move 49
  if "$zoneid" = "116" && matchre("(raven|ain)","%detour") then gosub move 3
  if "$zoneid" = "123" && "%detour" = "ain" then
            {
                gosub move 174
                gosub ferrylogic
            }
  if "$zoneid" = "123" && "%detour" = "raven" then
            {
                gosub move 133
                goto arrived
            }
  if "$zoneid" = "123" then gosub move 169
  if "$zoneid" = "116" && "%detour" = "outer" then
            {
                gosub move 225
                goto arrived
            }
  if "$zoneid" = "116" && "%detour" = "inner" then
            {
                gosub move 96
                goto arrived
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
  if "$zoneid" = "114" && "%detour" = "ain" then gosub move 34
  if "$zoneid" = "116" then gosub move 217
  if "$zoneid" = "126" then gosub move 103
  if "$zoneid" = "127" then gosub move 24
arrived:
  put #parse YOU ARRIVED!
  put #parse REACHED YOUR DESTINATION
  #put #play Just Arrived.wav
  Echo ##  YOU ARRIVED AT YOUR DESTINATION In %t seconds!  That's FAST! ##
  exit
nocoin:
  put #parse NO COINS!
  Echo ## You don't have enough coins to travel, you vagrant!  Trying to get coins from the nearest bank!!!
  pause
  pause
  if "$zoneid" = "1" then
        {
            var currencyneeded kro
            gosub move teller
            put withdraw 35 copper
            wait
        }
  if "$zoneid" = "60" then
        {
            var currencyneeded kro
            gosub move 57
            gosub move teller
            put withdraw 35 copper
            wait
        }
   if "$zoneid" = "30" then
        {
            var currencyneeded lir
            gosub move teller
            put withdraw 70 copper
            wait
        }
   if "$zoneid" = "7" then
        {
            var currencyneeded lir
            gosub move 349
            gosub move teller
            put withdraw 100 copper
            wait
            gosub move exchange
            put exchange 100 copper kronars for lirums
            wait
        }
    if "$zoneid" = "40" then
        {
            var currencyneeded lir
            gosub move 211
            gosub move teller
            put withdraw 70 copper
            wait
        }
    put wealth
    wait
    pause
    if %currencyneeded = "kro" && %kronars < 35 then goto coinquit
    if %currencyneeded = "lir" && %lirums < 70 then goto coinquit
    if %currencyneeded = "dok" && %dokoras < 50 then goto coinquit
    put #echo >Log Green You withdrew money to ride the ferry from Zone $zonename!
    ECHO YOU HAD MONEY IN THE BANK, LET'S TRY THIS AGAIN!
    pause
    goto %label
coinquit:
  echo YOU DIDN'T HAVE ENOUGH MONEY IN THE BANK TO RIDE PUBLIC TRANSPORT.  
  echo EITHER GET MORE ATHLETICS, OR MORE MONEY, YOU FUCKING NOOB!
  exit
move.retry:
  math move.retry add 1
  if %move.retry > 3 then goto move.fail
  echo ***
  echo *** Retrying move to $1 $2 in %move.retry second(s).
  echo ***
  pause %move.retry
  goto move.goto
move:
  var move.skip 0
  var move.retry 0
  var move.fail 0
  var move.room $0
move.goto:
  #gosub retreat
  matchre move.return ^YOU HAVE ARRIVED
  matchre move.skip ^SHOP CLOSED
  matchre move.retry ^MOVE FAILED
  matchre move.fail ^DESTINATION NOT FOUND
  matchre move.retry ^You can't go
  matchre move.retry ^You're still recovering from your recent attack\.
  matchre move.retreat ^You are engaged
  matchre move.retreat ^You can't do that while engaged!
  put #goto %move.room
  matchwait
move.fail:
  var move.fail 1
  goto move.return
move.retreat:
  pause .1
  gosub retreat
  pause .1
  goto move.retry
move.skip:
  var move.skip 1
retreat:
  pause .1
  pause .1
  send retreat;retreat
  pause .1
  pause .1
  return
move.return:
  pause .1
  pause .1
  #put #mapper reset
  pause .1
  pause .1
  return
ferrylogic:
  if contains("(1|7|30|60|40|113)","$zoneid" then goto ferry
  if "$zoneid" = "66" then
        {
            var direction north
            goto gondola
        }
  if "$zoneid" = "62" then
        {
            var direction south
            goto gondola
        }
  else goto nodestination
gondola:
  pause .1
  pause .1
  send look
  pause 3
  matchre ongondola \[Gondola\,
  if matchre ("$roomobjs","gondola") then send go gondola
  matchwait 2
  pause 10
  goto gondola
ongondola:
  pause 
  pause
  if "%direction" = "north" then put north
  else put south
gondolawait:
  pause
  waitforre ^With a soft
  put out
  pause
  put #mapper reset
  return
ferry:
  pause .1
  pause .1
  action var offtransport pier when the Riverhaven pier\.
  action var offtransport wharf when the Langenfirth wharf\.
  action var offtransport dock when \[\"Her Opulence\"\]|\[\"Hodierna\'s Grace\"\]|\[\"Kertigen\'s Honor\"\]|\[\"His Daring Exploit\"\]|\[The Evening Star\]|\[The Damaris\' Kiss\]|\[A Birch Skiff\]|\[A Highly Polished Skiff\]
  ## Future money stuff - "Hey," he says, "You haven't got enough lirums to pay for your trip.  Come back when you can afford the fare."
  matchre onferry \[\"Her Opulence\"\]|\[\"Hodierna\'s Grace\"\]|\[\"Kertigen\'s Honor\"\]|\[\"His Daring Exploit\"\]|\[\"Northern Pride\"\, Main Deck\]|\[\"Theren\'s Star\"\, Deck\]|\[The Evening Star\]|\[The Damaris\' Kiss\]|\[A Birch Skiff\]|\[A Highly Polished Skiff\]
  send look
  if matchre ("$roomobjs","Star") then send go ferry
  if matchre ("$roomobjs","skiff") then send go skiff
  if matchre ("$roomobjs","Kiss") then send go ferry
  if matchre ("$roomobjs","ferry") then send go ferry
  if matchre ("$roomobjs","barge") then send go barge
  matchwait 2
  pause 10
  goto ferry
onferry:
  pause .1
  pause .1
  matchre offtheride dock and its crew ties the (ferry|barge) off\.|^You come to a very soft stop|^The skiff lightly taps
  matchwait
offtheride:
  pause
  put go %offtransport
  pause
  put #mapper reset
  return

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